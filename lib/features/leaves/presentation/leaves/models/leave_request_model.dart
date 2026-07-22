import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';

// ─── Enums ────────────────────────────────────────────────────────────────────

enum LeaveStatus { accepted, pending, rejected }

extension LeaveStatusExt on LeaveStatus {
  String get label => switch (this) {
        LeaveStatus.accepted => 'Accepted',
        LeaveStatus.pending  => 'Pending Approval',
        LeaveStatus.rejected => 'Rejected',
      };

  Color get color => switch (this) {
        LeaveStatus.accepted => AppColors.primary,
        LeaveStatus.pending  => AppColors.orange,
        LeaveStatus.rejected => AppColors.errorBright,
      };
}

enum LeaveType { sick, other }

extension LeaveTypeExt on LeaveType {
  String get label => switch (this) {
        LeaveType.sick  => 'Sick',
        LeaveType.other => 'Other',
      };
}

// ─── Model ────────────────────────────────────────────────────────────────────

class LeaveRequest {
  final int days;
  final String dateLabel;
  final LeaveStatus status;
  final LeaveType type;
  final String requestedBy;
  final String requestedAt;
  final String detail;
  final List<String> fileNames;

  const LeaveRequest({
    required this.days,
    required this.dateLabel,
    required this.status,
    required this.type,
    this.requestedBy = 'Employee',
    this.requestedAt = '',
    this.detail = '',
    this.fileNames = const [],
  });
}

// ─── Dummy data ───────────────────────────────────────────────────────────────

const _jul2025 = <LeaveRequest>[
  LeaveRequest(
    days: 1,
    dateLabel: '16 Aug 2025',
    status: LeaveStatus.accepted,
    type: LeaveType.sick,
    requestedBy: 'Father',
    requestedAt: '12 Aug  10:00',
    detail: 'I have a medical appointment scheduled on this day and will not be able to attend work. Please consider this as a sick leave request.',
    fileNames: ['File 1.png'],
  ),
  LeaveRequest(
    days: 3,
    dateLabel: '12-14 Jul 2025',
    status: LeaveStatus.accepted,
    type: LeaveType.other,
    requestedBy: 'Employee',
    requestedAt: '10 Jul  09:30',
    detail: 'Family event requiring travel out of city for three days.',
    fileNames: [],
  ),
  LeaveRequest(
    days: 2,
    dateLabel: '5-6 Jun 2025',
    status: LeaveStatus.pending,
    type: LeaveType.sick,
    requestedBy: 'Employee',
    requestedAt: '03 Jun  11:15',
    detail: 'Fever and flu symptoms. Doctor advised rest for two days.',
    fileNames: ['medical_report.pdf'],
  ),
];

const _jun2025 = <LeaveRequest>[
  LeaveRequest(
    days: 5,
    dateLabel: '2-6 Jun 2025',
    status: LeaveStatus.accepted,
    type: LeaveType.sick,
    requestedBy: 'Employee',
    requestedAt: '01 Jun  08:45',
    detail: 'Post-surgery recovery leave as advised by the physician.',
    fileNames: ['prescription.pdf', 'discharge.jpg'],
  ),
  LeaveRequest(
    days: 1,
    dateLabel: '20 Jun 2025',
    status: LeaveStatus.rejected,
    type: LeaveType.other,
    requestedBy: 'Employee',
    requestedAt: '18 Jun  14:00',
    detail: 'Personal errand.',
    fileNames: [],
  ),
];

const _jul2026 = <LeaveRequest>[
  LeaveRequest(
    days: 2,
    dateLabel: '3-4 Jul 2026',
    status: LeaveStatus.pending,
    type: LeaveType.sick,
    requestedBy: 'Abdul Salam',
    requestedAt: '02 Jul  09:00',
    detail: 'Fever and body aches since last night. Doctor recommended two days of bed rest.',
    fileNames: ['doctor_note.pdf'],
  ),
  LeaveRequest(
    days: 1,
    dateLabel: '10 Jul 2026',
    status: LeaveStatus.accepted,
    type: LeaveType.other,
    requestedBy: 'Abdul Salam',
    requestedAt: '08 Jul  11:30',
    detail: 'Personal commitment that requires my presence out of the city.',
    fileNames: [],
  ),
  LeaveRequest(
    days: 3,
    dateLabel: '21-23 Jul 2026',
    status: LeaveStatus.rejected,
    type: LeaveType.other,
    requestedBy: 'Abdul Salam',
    requestedAt: '19 Jul  14:15',
    detail: "Family event — brother's wedding ceremony and reception.",
    fileNames: ['invitation.jpg', 'hall_booking.pdf'],
  ),
];

List<LeaveRequest> leavesDataFor(DateTime m) {
  if (m.year == 2026 && m.month == 7) return _jul2026;
  if (m.year == 2025 && m.month == 7) return _jul2025;
  if (m.year == 2025 && m.month == 6) return _jun2025;
  return [];
}
