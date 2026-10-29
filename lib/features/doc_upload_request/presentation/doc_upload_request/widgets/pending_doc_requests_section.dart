import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../doc_upload_request_exports.dart';

class PendingDocRequestsSection extends StatefulWidget {
  const PendingDocRequestsSection({super.key});

  @override
  State<PendingDocRequestsSection> createState() =>
      _PendingDocRequestsSectionState();
}

class _PendingDocRequestsSectionState extends State<PendingDocRequestsSection> {
  int? _pickingId;
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
    context.read<DocUploadRequestBloc>().add(
      DocUploadRequestsFetched(flgCompleted: completed),
    );
  }

  Future<void> _onRefresh() {
    final bloc = context.read<DocUploadRequestBloc>();
    final done = bloc.stream.firstWhere((s) => s.apiStatus != .LOADING);
    bloc.add(DocUploadRequestsFetched(flgCompleted: _showCompleted));
    return done;
  }

  Future<void> _startUpload(DocUploadRequestEntity request) async {
    final source = await showUploadSourceSheet(context);
    if (source == null || !mounted) return;

    setState(() => _pickingId = request.id);
    List<String>? filePaths;
    try {
      filePaths = source == UploadSource.camera
          ? await _scanWithCamera()
          : await _pickFiles();
    } finally {
      if (mounted) setState(() => _pickingId = null);
    }
    if (filePaths == null || filePaths.isEmpty || !mounted) return;

    final documentUploadBloc = context.read<DocumentUploadBloc>();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: documentUploadBloc,
          child: UploadPreviewPage(request: request, filePaths: filePaths!),
        ),
      ),
    );
  }

  // One-off throwaway bloc per scan — intentionally not closed, since the
  // handler may still be emitting a follow-up state (e.g. the reload after
  // an error) when this returns, and closing mid-emit throws.
  Future<List<String>?> _scanWithCamera() async {
    final bloc = sl<ScannerBloc>();
    bloc.add(const ScanStarted());
    final state = await bloc.stream.firstWhere((s) => s is! ScannerScanning);

    if (state is ScannerScanned) return state.imagePaths;
    if (state is ScannerError && mounted) {
      AppToastsUtils.showErrorTop(context, state.message);
    }
    return null;
  }

  Future<List<String>?> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: .custom,
      allowedExtensions: const ['jpg', 'jpeg', 'png', 'pdf'],
      allowMultiple: true,
    );
    final paths = result?.files.map((f) => f.path).whereType<String>().toList();
    if (paths == null || paths.isEmpty) return null;

    final pdfCount = paths
        .where((p) => p.toLowerCase().endsWith('.pdf'))
        .length;
    if (pdfCount > 0 && paths.length > 1) {
      if (mounted) {
        AppToastsUtils.showErrorTop(
          context,
          'Select either multiple images or a single PDF',
        );
      }
      return null;
    }
    return paths;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: context.pagePadding.copyWith(bottom: 4),
          child: _RequestTabBar(
            showCompleted: _showCompleted,
            onChanged: _switchTab,
          ),
        ),
        SizedBox(height: context.gridSpacing),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            color: context.accentBlue,
            child: BlocBuilder<DocUploadRequestBloc, DocUploadRequestState>(
              builder: (context, state) {
                if (state.apiStatus == .LOADING && state.requests.isEmpty) {
                  return _FillerPanel(
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

                if (state.apiStatus == .FAILURE && state.requests.isEmpty) {
                  return _FillerPanel(
                    child: Center(
                      child: InkWell(
                        onTap: () => context.read<DocUploadRequestBloc>().add(
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
                    child: Center(
                      child: Column(
                        mainAxisSize: .min,
                        children: [
                          Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              color: context.navyIconBg,
                              shape: .circle,
                            ),
                            child: _showCompleted
                                ? Icon(
                                    Iconsax.tick_circle,
                                    color: context.navyIconColor,
                                    size: 38,
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(22),
                                    child: Image.asset(
                                      AppIcons.documentIcon,
                                      color: context.navyIconColor,
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            _showCompleted
                                ? 'No completed requests'
                                : 'No pending requests',
                            style: context.titleMedium.copyWith(
                              color: context.textPrimary,
                              fontWeight: .w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _showCompleted
                                ? 'Completed uploads will show up here'
                                : "You're all caught up — nothing to upload",
                            style: context.bodySmall.copyWith(
                              color: context.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: context.pagePadding.copyWith(top: 0),
                  itemCount: state.requests.length,
                  separatorBuilder: (_, __) =>
                      SizedBox(height: context.gridSpacing),
                  itemBuilder: (context, index) {
                    final request = state.requests[index];
                    return _PendingRequestCard(
                      request: request,
                      isUploading: _pickingId == request.id,
                      onUpload: () => _startUpload(request),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// An always-scrollable filler so [RefreshIndicator] keeps working (pull
/// gesture needs a Scrollable) even for non-list states.
class _FillerPanel extends StatelessWidget {
  final Widget child;

  const _FillerPanel({required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [SliverFillRemaining(hasScrollBody: false, child: child)],
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
            child: completed
                ? Icon(Iconsax.tick_circle, color: statusColor, size: 21)
                : Padding(
                    padding: const EdgeInsets.all(11),
                    child: Image.asset(
                      AppIcons.documentIcon,
                      color: statusColor,
                    ),
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
                // Completed: feature name + upload time share one line (not
                // two) to keep the card compact. Pending: feature name only.
                Row(
                  children: [
                    Icon(
                      completed ? Iconsax.calendar_tick : Iconsax.briefcase,
                      size: 12,
                      color: context.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        completed && request.completedOn != null
                            ? '${request.hostFeatureName} · ${request.completedOn!.toLocal().fullFormat}'
                            : request.hostFeatureName,
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
          // Completed already has its checkmark on the leading icon chip —
          // no need for a second one trailing the card.
          if (!completed) ...[
            const SizedBox(width: 10),
            _UploadButton(isUploading: isUploading, onTap: onUpload),
          ],
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
