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
  bool _showCompleted = false;

  @override
  void initState() {
    super.initState();
    // The bloc is a shared singleton — if it's already holding a pending
    // list (e.g. fetched by the dashboard badge), reuse it instead of
    // firing a redundant request.
    final bloc = context.read<DocUploadRequestBloc>();
    final alreadyHasPending =
        bloc.state.apiStatus != .INITIAL && !bloc.state.flgCompleted;
    if (!alreadyHasPending) {
      bloc.add(const DocUploadRequestsFetched(flgCompleted: false));
    }
  }

  void _switchTab(bool completed) {
    if (_showCompleted == completed) return;
    setState(() => _showCompleted = completed);
    context
        .read<DocUploadRequestBloc>()
        .add(DocUploadRequestsFetched(flgCompleted: completed));
  }

  Future<void> _onRefresh() {
    final bloc = context.read<DocUploadRequestBloc>();
    final done = bloc.stream.firstWhere((s) => s.apiStatus != .LOADING);
    bloc.add(DocUploadRequestsFetched(flgCompleted: _showCompleted));
    return done;
  }

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

  double _panelHeight(BuildContext context) => Responsive.value<double>(
        context,
        phone: 230,
        tablet: 270,
        ipad: 300,
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<DocumentUploadBloc, DocumentUploadState>(
      listenWhen: (previous, current) =>
          previous.apiStatus != current.apiStatus &&
          current.apiStatus != .LOADING,
      listener: (context, state) {
        if (mounted) setState(() => _uploadingId = null);
      },
      child: Padding(
        padding: context.pagePadding.copyWith(bottom: 4),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            _RequestTabBar(
              showCompleted: _showCompleted,
              onChanged: _switchTab,
            ),
            SizedBox(height: context.gridSpacing),
            SizedBox(
              height: _panelHeight(context),
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                color: context.accentBlue,
                child: BlocBuilder<DocUploadRequestBloc, DocUploadRequestState>(
                  builder: (context, state) {
                    if (state.apiStatus == .LOADING &&
                        state.requests.isEmpty) {
                      return _FillerPanel(
                        height: _panelHeight(context),
                        child: Center(
                          child: Row(
                            mainAxisSize: .min,
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
                                'Loading requests…',
                                style: context.bodySmall.copyWith(
                                  color: context.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    if (state.apiStatus == .FAILURE &&
                        state.requests.isEmpty) {
                      return _FillerPanel(
                        height: _panelHeight(context),
                        child: Center(
                          child: InkWell(
                            onTap: () =>
                                context.read<DocUploadRequestBloc>().add(
                                      DocUploadRequestsFetched(
                                        flgCompleted: _showCompleted,
                                      ),
                                    ),
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisSize: .min,
                                children: [
                                  Icon(
                                    Iconsax.warning_2,
                                    size: 16,
                                    color: context.textSecondary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Couldn't load requests · Tap to retry",
                                    style: context.bodySmall.copyWith(
                                      color: context.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    if (state.requests.isEmpty) {
                      return _FillerPanel(
                        height: _panelHeight(context),
                        child: Center(
                          child: Text(
                            _showCompleted
                                ? 'No completed requests yet'
                                : "No pending requests · you're all caught up",
                            style: context.bodySmall.copyWith(
                              color: context.textSecondary,
                            ),
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
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
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A single-child, always-scrollable filler so [RefreshIndicator] keeps
/// working (pull gesture needs a Scrollable) even for non-list states.
class _FillerPanel extends StatelessWidget {
  final double height;
  final Widget child;

  const _FillerPanel({required this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [SizedBox(height: height, child: child)],
    );
  }
}

class _RequestTabBar extends StatelessWidget {
  final bool showCompleted;
  final ValueChanged<bool> onChanged;

  const _RequestTabBar({required this.showCompleted, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: context.navyCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.navyBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: _TabChip(
              label: 'Pending',
              icon: Iconsax.timer_1,
              selected: !showCompleted,
              onTap: () => onChanged(false),
            ),
          ),
          Expanded(
            child: _TabChip(
              label: 'Completed',
              icon: Iconsax.tick_circle,
              selected: showCompleted,
              onTap: () => onChanged(true),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _TabChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? context.accentBlue : AppColors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Icon(
                icon,
                size: 15,
                color: selected ? context.white : context.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: context.labelSmall.copyWith(
                  color: selected ? context.white : context.textSecondary,
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
    final completed = request.flgCompleted;
    final statusColor = completed
        ? (context.isDark ? AppColors.successLight : AppColors.greenDark)
        : context.navyIconColor;
    final chipBg = completed
        ? (context.isDark
            ? context.navyIconBg
            : AppColors.success.withValues(alpha: 0.10))
        : context.navyIconBg;

    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: context.navyCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: context.navyBorder),
        boxShadow: context.isDark
            ? null
            : [
                BoxShadow(
                  color: statusColor.withValues(alpha: 0.10),
                  blurRadius: 14,
                  offset: const Offset(0, 5),
                ),
              ],
      ),
      child: Row(
        crossAxisAlignment: .start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: context.isDark
                  ? RadialGradient(
                      colors: [
                        statusColor.withValues(alpha: 0.26),
                        statusColor.withValues(alpha: 0.06),
                      ],
                    )
                  : null,
              color: context.isDark ? null : chipBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              completed ? Iconsax.tick_circle : Iconsax.document_upload,
              color: statusColor,
              size: 21,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  request.purpose,
                  style: context.bodyMedium.copyWith(
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
                if (completed && request.completedOn != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Iconsax.calendar_tick,
                        size: 12,
                        color: context.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Uploaded ${request.completedOn!.displayDate}',
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 10),
          completed
              ? _CompletedBadge(color: statusColor)
              : _UploadButton(isUploading: isUploading, onTap: onUpload),
        ],
      ),
    );
  }
}

class _CompletedBadge extends StatelessWidget {
  final Color color;

  const _CompletedBadge({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: context.isDark ? 0.14 : 0.10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Icon(Iconsax.tick_circle, size: 14, color: color),
          const SizedBox(width: 5),
          Text(
            'Done',
            style: context.labelSmall.copyWith(
              color: color,
              fontWeight: .w700,
            ),
          ),
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
    final foreground = context.isDark ? context.accentBlue : context.white;

    return Material(
      color: isUploading ? context.navyIconBg : AppColors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        decoration: BoxDecoration(
          color: isUploading
              ? null
              : (context.isDark
                  ? context.accentBlue.withValues(alpha: 0.16)
                  : null),
          gradient: isUploading || context.isDark
              ? null
              : LinearGradient(
                  colors: [
                    context.accentBlue,
                    context.accentBlue.withValues(alpha: 0.82),
                  ],
                  begin: .topLeft,
                  end: .bottomRight,
                ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: isUploading ? null : onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
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
                      Icon(Iconsax.export_1, size: 14, color: foreground),
                      const SizedBox(width: 6),
                      Text(
                        'Upload',
                        style: context.labelSmall.copyWith(
                          color: foreground,
                          fontWeight: .w700,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
