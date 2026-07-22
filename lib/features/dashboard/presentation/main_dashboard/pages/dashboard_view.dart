import 'package:flutter/material.dart';
import '../../../../../core/services/current_user.dart';
import '../../../dashboard_exports.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return currentUser.isAdmin ? const AdminDashboard() : const EmployeeDashboard();
  }
}
