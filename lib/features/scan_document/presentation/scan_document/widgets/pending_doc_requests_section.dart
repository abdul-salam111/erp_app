import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../doc_upload_request/doc_upload_request_exports.dart';

class PendingDocRequestsSection extends StatefulWidget {
  const PendingDocRequestsSection({super.key});

  @override
  State<PendingDocRequestsSection> createState() =>
      _PendingDocRequestsSectionState();
}

class _PendingDocRequestsSectionState
    extends State<PendingDocRequestsSection> {
  int? _uploadingId;

  Future<void> _pickAndUpload(DocUploadRequestEntity request) async {
    final result = await FilePicker.platform.pickFiles(
      type: .custom,
      allowedExtensions: const ['jpg', 'jpeg', 'png', 'pdf'],
    );
    final path = result?.files.single.path;
    if (path == null || !mounted) return;

    setState(() => _uploadingId = request.id);
    context.read<DocumentUploadBloc>().add(
          DocumentUploadSubmitted(id: request.id, filePath: path),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DocumentUploadBloc, DocumentUploadState>(
      listenWhen: (previous, current) =>
          previous.apiStatus != current.apiStatus &&
          current.apiStatus != .LOADING,
      listener: (context, state) {
        if (mounted) setState(() => _uploadingId = null);
      },
      child: BlocBuilder<DocUploadRequestBloc, DocUploadRequestState>(
        builder: (context, state) {
          if (state.apiStatus == .LOADING && state.requests.isEmpty) {
            return Padding(
              padding: context.pagePadding.copyWith(bottom: 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: context.accentBlue,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Checking pending requests…',
                    style: context.bodySmall.copyWith(
                      color: context.textSecondary,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state.apiStatus == .FAILURE && state.requests.isEmpty) {
            return Padding(
              padding: context.pagePadding.copyWith(bottom: 0),
              child: InkWell(
                onTap: () => context.read<DocUploadRequestBloc>().add(
                      const DocUploadRequestsFetched(flgCompleted: false),
                    ),
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  children: [
                    Icon(
                      Iconsax.warning_2,
                      size: 16,
                      color: context.textSecondary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Couldn't load pending requests · Tap to retry",
                        style: context.bodySmall.copyWith(
                          color: context.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state.requests.isEmpty) return const SizedBox.shrink();

          return Padding(
            padding: context.pagePadding.copyWith(bottom: 4),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                _SectionTitle(count: state.requests.length),
                SizedBox(height: context.gridSpacing),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.requests.length,
                  separatorBuilder: (_, __) =>
                      SizedBox(height: context.gridSpacing),
                  itemBuilder: (context, index) {
                    final request = state.requests[index];
                    return _PendingRequestCard(
                      request: request,
                      isUploading: _uploadingId == request.id,
                      onUpload: () => _pickAndUpload(request),
                    );
                  },
                ),
                SizedBox(height: context.gridSpacing),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final int count;

  const _SectionTitle({required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 16,
          decoration: BoxDecoration(
            color: context.accentBlue,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Pending Document Requests',
          style: context.titleSmall.copyWith(
            fontWeight: .w700,
            color: context.textPrimary,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.errorBright,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$count',
            style: context.labelSmall.copyWith(
              color: context.white,
              fontWeight: .w700,
              fontSize: 11,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}

class _PendingRequestCard extends StatelessWidget {
  final DocUploadRequestEntity request;
  final bool isUploading;
  final VoidCallback onUpload;

  const _PendingRequestCard({
    required this.request,
    required this.isUploading,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.navyCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.navyBorder),
      ),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: context.navyIconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Iconsax.document_upload,
              color: context.navyIconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  request.purpose,
                  style: context.bodySmall.copyWith(
                    color: context.textPrimary,
                    fontWeight: .w700,
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Iconsax.briefcase,
                      size: 12,
                      color: context.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        request.hostFeatureName,
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _UploadButton(isUploading: isUploading, onTap: onUpload),
        ],
      ),
    );
  }
}

class _UploadButton extends StatelessWidget {
  final bool isUploading;
  final VoidCallback onTap;

  const _UploadButton({required this.isUploading, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isUploading
          ? context.navyIconBg
          : context.accentBlue.withValues(alpha: context.isDark ? 0.18 : 1),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: isUploading ? null : onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          child: isUploading
              ? SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: context.navyIconColor,
                  ),
                )
              : Row(
                  mainAxisSize: .min,
                  children: [
                    Icon(
                      Iconsax.export_1,
                      size: 14,
                      color: context.isDark
                          ? context.accentBlue
                          : context.white,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Upload',
                      style: context.labelSmall.copyWith(
                        color: context.isDark
                            ? context.accentBlue
                            : context.white,
                        fontWeight: .w700,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
