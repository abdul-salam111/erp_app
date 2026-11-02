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
  // Separate bloc instance for the Completed tab — TabBarView keeps both
  // tabs' sections alive at once (so they can be swiped between), and the
  // shared singleton bloc can only hold one `requests` list at a time. The
  // Pending tab keeps using the shared singleton (reused from the dashboard
  // badge fetch); Completed gets its own so the two don't clobber each other.
  late final _completedBloc = DocUploadRequestBloc(
    getDocUploadRequestsUsecase: sl(),
  );

  @override
  void dispose() {
    _tabController.dispose();
    _completedBloc.close();
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
        backgroundColor: context.isDark ? context.background : context.surface,
        appBar: CustomAppBar(
          title: 'Documents',
          bottom: DocRequestTabBar(controller: _tabController),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            const PendingDocRequestsSection(showCompleted: false),
            BlocProvider.value(
              value: _completedBloc,
              child: const PendingDocRequestsSection(showCompleted: true),
            ),
          ],
        ),
      ),
    );
  }
}
