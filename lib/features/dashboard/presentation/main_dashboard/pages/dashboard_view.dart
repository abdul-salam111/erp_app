import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/services/current_user.dart';
import '../../../dashboard_exports.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  AdminDashboardBloc? _adminBloc;

  @override
  void initState() {
    super.initState();
    if (currentUser.isAdmin) {
      _adminBloc = sl<AdminDashboardBloc>()..add(const DashboardDataRequested());
    }
  }

  @override
  void dispose() {
    _adminBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_adminBloc != null) {
      return BlocProvider.value(
        value: _adminBloc!,
        child: const AdminDashboard(),
      );
    }
    return const EmployeeDashboard();
  }
}
