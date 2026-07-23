import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';

enum OvertimeType { preApproved, emergency, weekend }

extension OvertimeTypeX on OvertimeType {
  String get label => switch (this) {
        OvertimeType.preApproved => 'Pre-Approved',
        OvertimeType.emergency   => 'Emergency',
        OvertimeType.weekend     => 'Weekend',
      };
}

enum OvertimeStatus { pending, approved, rejected, paid }

extension OvertimeStatusX on OvertimeStatus {
  String get label => switch (this) {
        OvertimeStatus.pending  => 'Pending',
        OvertimeStatus.approved => 'Approved',
        OvertimeStatus.rejected => 'Rejected',
        OvertimeStatus.paid     => 'Paid',
      };

  Color get color => switch (this) {
        OvertimeStatus.pending  => AppColors.amber,
        OvertimeStatus.approved => AppColors.creditGreen,
        OvertimeStatus.rejected => AppColors.debitRed,
        OvertimeStatus.paid     => AppColors.primary,
      };

  Color get bgColor => switch (this) {
        OvertimeStatus.pending  => AppColors.yellow.withValues(alpha: 0.15),
        OvertimeStatus.approved => AppColors.creditContainer,
        OvertimeStatus.rejected => AppColors.debitContainer,
        OvertimeStatus.paid     => AppColors.primaryLight.withValues(alpha: 0.15),
      };
}

class OvertimeRecord {
  final DateTime date;
  final double hours;
  final OvertimeType type;
  final OvertimeStatus status;
  final double ratePerHour;
  final String? approver;
  final String? remarks;

  const OvertimeRecord({
    required this.date,
    required this.hours,
    required this.type,
    required this.status,
    required this.ratePerHour,
    this.approver,
    this.remarks,
  });

  double get amount => hours * ratePerHour;
}

final List<OvertimeRecord> dummyOvertimeRecords = [
  OvertimeRecord(
    date: DateTime(2025, 7, 18),
    hours: 3.0,
    type: OvertimeType.preApproved,
    status: OvertimeStatus.paid,
    ratePerHour: 750,
    approver: 'Ahmed Raza',
    remarks: 'Project deadline',
  ),
  OvertimeRecord(
    date: DateTime(2025, 7, 12),
    hours: 2.5,
    type: OvertimeType.weekend,
    status: OvertimeStatus.approved,
    ratePerHour: 1000,
    approver: 'Ahmed Raza',
    remarks: 'Client demo preparation',
  ),
  OvertimeRecord(
    date: DateTime(2025, 7, 7),
    hours: 1.5,
    type: OvertimeType.emergency,
    status: OvertimeStatus.approved,
    ratePerHour: 750,
    approver: 'Sara Khan',
    remarks: 'Server downtime resolution',
  ),
  OvertimeRecord(
    date: DateTime(2025, 7, 3),
    hours: 4.0,
    type: OvertimeType.preApproved,
    status: OvertimeStatus.pending,
    ratePerHour: 750,
    approver: null,
    remarks: 'Sprint release',
  ),
  OvertimeRecord(
    date: DateTime(2025, 6, 28),
    hours: 2.0,
    type: OvertimeType.emergency,
    status: OvertimeStatus.rejected,
    ratePerHour: 750,
    approver: 'Sara Khan',
    remarks: 'Not pre-authorized',
  ),
];
