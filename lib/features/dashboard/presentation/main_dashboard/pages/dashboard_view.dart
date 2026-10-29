import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/services/current_user.dart';
import '../../../../doc_upload_request/doc_upload_request_exports.dart';
import '../../../dashboard_exports.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  AdminDashboardBloc? _adminBloc;
  DocUploadRequestBloc? _docUploadRequestBloc;

  @override
  void initState() {
    super.initState();
    if (currentUser.isAdmin) {
      _adminBloc = sl<AdminDashboardBloc>()..add(const DashboardDataRequested());

      // Singleton — shared with other screens (e.g. Scan Document), so only
      // fetch if nobody has populated it yet.
      _docUploadRequestBloc = sl<DocUploadRequestBloc>();
      if (_docUploadRequestBloc!.state.apiStatus == ApiStatus.INITIAL) {
        _docUploadRequestBloc!
            .add(const DocUploadRequestsFetched(flgCompleted: false));
      }
    }
  }

  @override
  void dispose() {
    _adminBloc?.close();
    // _docUploadRequestBloc is an app-wide singleton — other screens keep
    // using it after this view is gone, so it must not be closed here.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_adminBloc != null) {
      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _adminBloc!),
          BlocProvider.value(value: _docUploadRequestBloc!),
        ],
        child: const AdminDashboard(),
      );
    }
    return const EmployeeDashboard();
  }
}
