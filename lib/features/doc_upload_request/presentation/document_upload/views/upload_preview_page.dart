import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../domain/entities/doc_upload_request_entity.dart';
import '../blocs/document_upload_bloc.dart';
import '../blocs/document_upload_event.dart';
import '../blocs/document_upload_state.dart';
import '../models/upload_page.dart';
import '../utils/pdf_merge.dart';
import '../utils/pdf_pages.dart';
import 'full_screen_page_viewer.dart';

/// Organize pages (reorder, delete, zoom) before uploading — any PDF among
/// [filePaths] is exploded into individual page thumbnails so every page,
/// whatever it came from, can be managed the same way.
class UploadPreviewPage extends StatefulWidget {
  final DocUploadRequestEntity request;
  final List<String> filePaths;

  const UploadPreviewPage({
    super.key,
    required this.request,
    required this.filePaths,
  });

  @override
  State<UploadPreviewPage> createState() => _UploadPreviewPageState();
}

class _UploadPreviewPageState extends State<UploadPreviewPage> {
  List<UploadPage>? _pages;
  bool _isPreparingPdf = false;

  @override
  void initState() {
    super.initState();
    _loadPages();
  }

  Future<void> _loadPages() async {
    final pages = await buildUploadPages(widget.filePaths);
    if (mounted) setState(() => _pages = pages);
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final pages = List.of(_pages!);
      final item = pages.removeAt(oldIndex);
      pages.insert(newIndex, item);
      _pages = pages;
    });
  }

  void _deleteAt(int index) {
    setState(() => _pages = List.of(_pages!)..removeAt(index));
  }

  void _openFullScreen(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => FullScreenPageViewer(
          pages: _pages!,
          initialIndex: index,
          onPagesChanged: (updated) => setState(() => _pages = updated),
        ),
      ),
    );
  }

  Future<void> _handleUpload() async {
    final pages = _pages;
    if (pages == null || pages.isEmpty) return;

    final bloc = context.read<DocumentUploadBloc>();
    String finalPath;

    if (pages.length > 1) {
      setState(() => _isPreparingPdf = true);
      try {
        finalPath = await mergeImagesToPdf(
          pages.map((p) => p.imagePath).toList(),
        );
      } catch (e) {
        if (!mounted) return;
        setState(() => _isPreparingPdf = false);
        AppToastsUtils.showErrorTop(context, 'Failed to prepare PDF: $e');
        return;
      }
      if (!mounted) return;
      setState(() => _isPreparingPdf = false);
    } else {
      finalPath = pages.first.imagePath;
    }

    bloc.add(
      DocumentUploadSubmitted(id: widget.request.id, filePath: finalPath),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = _pages;

    return BlocListener<DocumentUploadBloc, DocumentUploadState>(
      listenWhen: (previous, current) =>
          previous.apiStatus != current.apiStatus,
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: context.surface,
        appBar: AppBar(
          backgroundColor: context.background,
          foregroundColor: context.textPrimary,
          elevation: 0,
          surfaceTintColor: context.background,
          title: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              Text(
                'Preview & Upload',
                style: context.titleMedium.copyWith(
                  color: context.textPrimary,
                  fontWeight: .w600,
                ),
              ),
              Text(
                widget.request.purpose,
                style: context.bodySmall.copyWith(color: context.textSecondary),
              ),
            ],
          ),
        ),
        body: pages == null
            ? const _PreparingPages()
            : _PageGrid(
                pages: pages,
                onReorder: _onReorder,
                onDelete: _deleteAt,
                onTap: _openFullScreen,
              ),
        bottomNavigationBar: pages == null
            ? null
            : _UploadBar(
                isPreparing: _isPreparingPdf,
                hasPages: pages.isNotEmpty,
                onUpload: _handleUpload,
              ),
      ),
    );
  }
}

class _PreparingPages extends StatelessWidget {
  const _PreparingPages();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          CircularProgressIndicator(color: context.accentBlue),
          const SizedBox(height: 16),
          Text(
            'Preparing pages…',
            style: context.bodySmall.copyWith(color: context.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _PageGrid extends StatelessWidget {
  final List<UploadPage> pages;
  final ReorderCallback onReorder;
  final ValueChanged<int> onDelete;
  final ValueChanged<int> onTap;

  const _PageGrid({
    required this.pages,
    required this.onReorder,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (pages.isEmpty) {
      return Center(
        child: Text(
          'No pages — go back and add at least one',
          style: context.bodySmall.copyWith(color: context.textSecondary),
        ),
      );
    }

    return ReorderableGridView.builder(
      padding: context.pagePadding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.gridColumnCount,
        mainAxisSpacing: context.gridSpacing,
        crossAxisSpacing: context.gridSpacing,
        childAspectRatio: 0.72,
      ),
      itemCount: pages.length,
      onReorder: onReorder,
      itemBuilder: (context, index) {
        final page = pages[index];
        return _PageThumbnail(
          key: ValueKey(page.id),
          page: page,
          pageNumber: index + 1,
          onTap: () => onTap(index),
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}

class _PageThumbnail extends StatelessWidget {
  final UploadPage page;
  final int pageNumber;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _PageThumbnail({
    super.key,
    required this.page,
    required this.pageNumber,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: .expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: context.surfaceElevated,
              child: Image.file(
                File(page.imagePath),
                fit: .cover,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.broken_image_outlined,
                  color: context.textDisabled,
                ),
              ),
            ),
          ),
          Positioned(
            left: 6,
            bottom: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '$pageNumber',
                style: context.labelSmall.copyWith(
                  color: AppColors.white,
                  fontWeight: .w700,
                ),
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 4,
            child: Material(
              color: AppColors.black.withValues(alpha: 0.5),
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onDelete,
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.close_rounded,
                    size: 16,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UploadBar extends StatelessWidget {
  final bool isPreparing;
  final bool hasPages;
  final VoidCallback onUpload;

  const _UploadBar({
    required this.isPreparing,
    required this.hasPages,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentUploadBloc, DocumentUploadState>(
      builder: (context, state) {
        final uploading = state.apiStatus == ApiStatus.LOADING;
        final busy = isPreparing || uploading;
        final disabled = busy || !hasPages;

        return Container(
          decoration: BoxDecoration(
            color: context.surfaceElevated,
            border: Border(top: BorderSide(color: context.border)),
          ),
          padding: EdgeInsets.fromLTRB(
            20,
            12,
            20,
            12 + MediaQuery.of(context).padding.bottom,
          ),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: disabled ? null : onUpload,
              icon: busy
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: context.white,
                      ),
                    )
                  : const Icon(Iconsax.export_1, size: 18),
              label: Text(
                busy
                    ? (isPreparing ? 'Preparing…' : 'Uploading…')
                    : (hasPages ? 'Upload' : 'No pages to upload'),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: context.accentBlue,
                foregroundColor: context.white,
                disabledBackgroundColor: context.grey200,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: context.bodyMedium.copyWith(fontWeight: .w700),
              ),
            ),
          ),
        );
      },
    );
  }
}
