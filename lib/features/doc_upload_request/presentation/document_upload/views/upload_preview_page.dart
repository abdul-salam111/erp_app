import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _isPreparingUpload = false;

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

    setState(() => _isPreparingUpload = true);
    List<String> filePaths;
    try {
      filePaths = await _resolveUploadFiles(pages);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isPreparingUpload = false);
      AppToastsUtils.showErrorTop(context, 'Failed to prepare upload: $e');
      return;
    }
    if (!mounted) return;
    setState(() => _isPreparingUpload = false);

    bloc.add(
      DocumentUploadSubmitted(id: widget.request.id, filePaths: filePaths),
    );
  }

  /// If every current page still traces back to the same single original
  /// PDF, untouched (same pages, same order) — send that original file.
  /// If it's that same PDF but reordered/with pages removed — rebuild a
  /// PDF from the edited pages. Otherwise (plain images, or a mix) — send
  /// each page as its own file in the upload array.
  Future<List<String>> _resolveUploadFiles(List<UploadPage> pages) async {
    final sourcePdfPaths = pages.map((p) => p.sourcePdfPath).toSet();
    final fromSinglePdf =
        sourcePdfPaths.length == 1 && sourcePdfPaths.first != null;

    if (fromSinglePdf) {
      final pdfPath = sourcePdfPaths.first!;
      final originalCount = pages.first.sourcePdfPageCount!;
      final unmodified =
          pages.length == originalCount &&
          pages.indexed.every(
            (entry) => entry.$2.sourcePdfPageIndex == entry.$1,
          );

      if (unmodified) return [pdfPath];

      final rebuilt = await mergeImagesToPdf(
        pages.map((p) => p.imagePath).toList(),
      );
      return [rebuilt];
    }

    return pages.map((p) => p.imagePath).toList();
  }

  Future<bool> _confirmDiscard() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: ctx.surfaceElevated,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(
          'Discard these pages?',
          style: ctx.titleMedium.copyWith(
            color: ctx.textPrimary,
            fontWeight: .w600,
          ),
        ),
        content: Text(
          'Going back now will lose the pages you scanned/picked here — they haven\'t been uploaded yet.',
          style: ctx.bodySmall.copyWith(color: ctx.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text('Cancel', style: TextStyle(color: ctx.textSecondary)),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: ctx.error,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Discard', style: TextStyle(color: ctx.white)),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final pages = _pages;

    return BlocConsumer<DocumentUploadBloc, DocumentUploadState>(
      listenWhen: (previous, current) =>
          previous.apiStatus != current.apiStatus,
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, uploadState) {
        final isUploading =
            _isPreparingUpload || uploadState.apiStatus == ApiStatus.LOADING;
        final hasPages = pages != null && pages.isNotEmpty;
        final headerColor = context.isDark
            ? AppColors.navyHeaderDark
            : context.primary;

        return PopScope(
          canPop: !hasPages,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;
            if (isUploading) {
              AppToastsUtils.showErrorTop(
                context,
                'Please wait for the upload to finish',
              );
              return;
            }
            final confirmed = await _confirmDiscard();
            if (confirmed && context.mounted) Navigator.of(context).pop();
          },
          child: Scaffold(
            backgroundColor: context.surface,
            appBar: AppBar(
              backgroundColor: headerColor,
              foregroundColor: AppColors.white,
              iconTheme: const IconThemeData(color: AppColors.white),
              elevation: 0,
              surfaceTintColor: headerColor,
              title: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(
                    'Preview & Upload',
                    style: context.titleMedium.copyWith(
                      color: AppColors.white,
                      fontWeight: .w600,
                    ),
                  ),
                  Text(
                    widget.request.purpose,
                    style: context.bodySmall.copyWith(
                      color: AppColors.white.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    if (hasPages) _ReorderHintBar(pageCount: pages.length),
                    Expanded(
                      child: pages == null
                          ? const _PreparingPages()
                          : _PageGrid(
                              pages: pages,
                              onReorder: _onReorder,
                              onDelete: _deleteAt,
                              onTap: _openFullScreen,
                            ),
                    ),
                  ],
                ),
                if (isUploading) const _UploadingOverlay(),
              ],
            ),
            bottomNavigationBar: pages == null
                ? null
                : _UploadBar(
                    hasPages: pages.isNotEmpty,
                    isBusy: isUploading,
                    onUpload: _handleUpload,
                  ),
          ),
        );
      },
    );
  }
}

class _UploadingOverlay extends StatelessWidget {
  const _UploadingOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AbsorbPointer(
        child: Container(
          color: AppColors.black.withValues(alpha: 0.45),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
              decoration: BoxDecoration(
                color: context.surfaceElevated,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                mainAxisSize: .min,
                children: [
                  CircularProgressIndicator(color: context.accentBlue),
                  const SizedBox(height: 16),
                  Text(
                    'Uploading…',
                    style: context.bodyMedium.copyWith(
                      color: context.textPrimary,
                      fontWeight: .w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ReorderHintBar extends StatelessWidget {
  final int pageCount;

  const _ReorderHintBar({required this.pageCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        context.pagePadding.left,
        10,
        context.pagePadding.right,
        2,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: context.navyIconBg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Iconsax.arrange_square_2,
            size: 15,
            color: context.navyIconColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$pageCount ${pageCount == 1 ? 'page' : 'pages'} · hold & drag a page to reorder',
              style: context.labelSmall.copyWith(
                color: context.textSecondary,
                fontWeight: .w600,
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
        ],
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
      onDragStart: (_) => HapticFeedback.mediumImpact(),
      // Lift the tile — scale up, tilt slightly, deepen the shadow — so
      // picking a page up reads as physically grabbing a tile, CamScanner
      // style, instead of just silently following the finger.
      dragWidgetBuilderV2: DragWidgetBuilderV2(
        builder: (index, child, screenshot) => Transform.rotate(
          angle: 0.035,
          child: Transform.scale(
            scale: 1.07,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: child,
            ),
          ),
        ),
      ),
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
      child: Container(
        // A soft shadow (or a border in dark mode, where shadows read as
        // muddy) reads each page as a liftable tile — reinforcing that it
        // can be picked up and dragged, not just a static photo in a list.
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: context.isDark ? Border.all(color: context.navyBorder) : null,
          boxShadow: context.isDark
              ? null
              : [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.14),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
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
      ),
    );
  }
}

class _UploadBar extends StatelessWidget {
  final bool hasPages;
  final bool isBusy;
  final VoidCallback onUpload;

  const _UploadBar({
    required this.hasPages,
    required this.isBusy,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = isBusy || !hasPages;

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
        // Busy state is communicated by the full-screen overlay, not a
        // spinner on the button — the button just goes disabled.
        child: FilledButton.icon(
          onPressed: disabled ? null : onUpload,
          icon: const Icon(Iconsax.export_1, size: 18),
          label: Text(
            isBusy
                ? 'Uploading…'
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
  }
}
