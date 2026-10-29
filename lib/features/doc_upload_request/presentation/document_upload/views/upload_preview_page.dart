import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../domain/entities/doc_upload_request_entity.dart';
import '../blocs/document_upload_bloc.dart';
import '../blocs/document_upload_event.dart';
import '../blocs/document_upload_state.dart';
import '../utils/pdf_merge.dart';

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
  late final PageController _pageController;
  int _currentPage = 0;
  bool _isPreparing = false;

  bool get _isSinglePdf =>
      widget.filePaths.length == 1 &&
      widget.filePaths.first.toLowerCase().endsWith('.pdf');

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _handleUpload() async {
    final bloc = context.read<DocumentUploadBloc>();
    String finalPath;

    if (widget.filePaths.length > 1) {
      setState(() => _isPreparing = true);
      try {
        finalPath = await mergeImagesToPdf(widget.filePaths);
      } catch (e) {
        if (!mounted) return;
        setState(() => _isPreparing = false);
        AppToastsUtils.showErrorTop(context, 'Failed to prepare PDF: $e');
        return;
      }
      if (!mounted) return;
      setState(() => _isPreparing = false);
    } else {
      finalPath = widget.filePaths.first;
    }

    bloc.add(
      DocumentUploadSubmitted(id: widget.request.id, filePath: finalPath),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            Expanded(
              child: _isSinglePdf
                  ? _PdfPreview(path: widget.filePaths.first)
                  : _ImagesPreview(
                      paths: widget.filePaths,
                      controller: _pageController,
                      onPageChanged: (i) => setState(() => _currentPage = i),
                    ),
            ),
            if (!_isSinglePdf && widget.filePaths.length > 1)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: .center,
                  children: List.generate(widget.filePaths.length, (i) {
                    final active = i == _currentPage;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: active ? 20 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: active
                            ? context.accentBlue
                            : context.textDisabled,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
              ),
            _UploadBar(isPreparing: _isPreparing, onUpload: _handleUpload),
          ],
        ),
      ),
    );
  }
}

class _ImagesPreview extends StatelessWidget {
  final List<String> paths;
  final PageController controller;
  final ValueChanged<int> onPageChanged;

  const _ImagesPreview({
    required this.paths,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: paths.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: context.surfaceElevated,
            child: InteractiveViewer(
              child: Image.file(
                File(paths[index]),
                fit: .contain,
                errorBuilder: (_, __, ___) => Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: context.textDisabled,
                    size: 64,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PdfPreview extends StatelessWidget {
  final String path;

  const _PdfPreview({required this.path});

  @override
  Widget build(BuildContext context) {
    final name = path.split('/').last;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: context.navyIconBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Iconsax.document_text,
                color: context.navyIconColor,
                size: 42,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              textAlign: .center,
              style: context.bodyMedium.copyWith(
                color: context.textPrimary,
                fontWeight: .w600,
              ),
              maxLines: 2,
              overflow: .ellipsis,
            ),
            const SizedBox(height: 6),
            Text(
              'PDF document',
              style: context.bodySmall.copyWith(color: context.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}

class _UploadBar extends StatelessWidget {
  final bool isPreparing;
  final VoidCallback onUpload;

  const _UploadBar({required this.isPreparing, required this.onUpload});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentUploadBloc, DocumentUploadState>(
      builder: (context, state) {
        final busy = isPreparing || state.apiStatus == ApiStatus.LOADING;
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
              onPressed: busy ? null : onUpload,
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
                busy ? (isPreparing ? 'Preparing…' : 'Uploading…') : 'Upload',
              ),
              style: FilledButton.styleFrom(
                backgroundColor: context.accentBlue,
                foregroundColor: context.white,
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
