import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/services/current_user.dart';
import '../../../dashboard_exports.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    
    if (currentUser.isAdmin) {
      return BlocProvider(
        create: (_) => sl<AdminDashboardBloc>()..add(const DashboardDataRequested()),
        child: const AdminDashboard(),
      );
    }
    return const EmployeeDashboard();
  }
}
