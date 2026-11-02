import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../doc_upload_request_exports.dart';
import '../widgets/pending_doc_requests_section.dart';

class ScanDocumentView extends StatelessWidget {
  const ScanDocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Singleton — already populated by the dashboard in most cases, so
        // reuse it here instead of refetching. PendingDocRequestsSection
        // triggers a fetch itself only if nothing has been loaded yet.
        BlocProvider.value(value: sl<DocUploadRequestBloc>()),
        BlocProvider(create: (_) => sl<DocumentUploadBloc>()),
      ],
      child: const _ScanDocumentBody(),
    );
  }
}

class _ScanDocumentBody extends StatefulWidget {
  const _ScanDocumentBody();

  @override
  State<_ScanDocumentBody> createState() => _ScanDocumentBodyState();
}

class _ScanDocumentBodyState extends State<_ScanDocumentBody>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  bool _showCompleted = false;
  int _lastIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabController.index == _lastIndex) return;
    _lastIndex = _tabController.index;
    final completed = _lastIndex == 1;
    setState(() => _showCompleted = completed);
    context.read<DocUploadRequestBloc>().add(
      DocUploadRequestsFetched(flgCompleted: completed),
    );
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DocumentUploadBloc, DocumentUploadState>(
      listenWhen: (previous, current) =>
          previous.apiStatus != current.apiStatus,
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(context, 'Document uploaded');
          context.read<DocUploadRequestBloc>().add(
            const DocUploadRequestsFetched(flgCompleted: false),
          );
          context.read<DocumentUploadBloc>().add(const DocumentUploadReset());
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(
            context,
            state.message ?? 'Upload failed',
          );
          context.read<DocumentUploadBloc>().add(const DocumentUploadReset());
        }
      },
      child: Scaffold(
        backgroundColor: context.surface,
        appBar: CustomAppBar(
          title: 'Documents',
          bottom: DocRequestTabBar(controller: _tabController),
        ),
        body: PendingDocRequestsSection(showCompleted: _showCompleted),
      ),
    );
  }
}
