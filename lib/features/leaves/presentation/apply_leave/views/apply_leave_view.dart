import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/compact_date_picker.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../blocs/apply_leave_bloc.dart';
import '../blocs/apply_leave_event.dart';
import '../blocs/apply_leave_state.dart';

const _monthNames = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

String _fmt(DateTime d) =>
    '${d.day.toString().padLeft(2, '0')}-${_monthNames[d.month - 1]}-${d.year}';

class ApplyLeaveView extends StatelessWidget {
  const ApplyLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ApplyLeaveBloc>(),
      child: const _ApplyLeaveBody(),
    );
  }
}

class _ApplyLeaveBody extends StatefulWidget {
  const _ApplyLeaveBody();

  @override
  State<_ApplyLeaveBody> createState() => _ApplyLeaveBodyState();
}

class _ApplyLeaveBodyState extends State<_ApplyLeaveBody> {
  DateTime _requestDate = DateTime.now();
  DateTimeRange _dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );
  String _leaveType = 'Sick';
  final _detailController = TextEditingController();
  final List<PlatformFile> _pickedFiles = [];

  static const _leaveTypes = ['Sick', 'Annual', 'Other'];

  @override
  void dispose() {
    _detailController.dispose();
    super.dispose();
  }

  Future<void> _pickRequestDate() async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: _requestDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) setState(() => _requestDate = picked);
  }

  Future<void> _pickDateRange() async {
    final range = await showDateRangePicker(
      context: context,
      initialDateRange: _dateRange,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) => Theme(
        data: Theme.of(
          context,
        ).copyWith(colorScheme: ColorScheme.light(primary: context.primary)),
        child: child!,
      ),
    );
    if (range != null) setState(() => _dateRange = range);
  }

  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'doc', 'docx'],
    );
    if (result != null) {
      setState(() {
        for (final file in result.files) {
          if (!_pickedFiles.any((f) => f.name == file.name)) {
            _pickedFiles.add(file);
          }
        }
      });
    }
  }

  void _removeFile(int index) => setState(() => _pickedFiles.removeAt(index));

  void _submit() {
    context.read<ApplyLeaveBloc>().add(
      ApplyLeaveSubmitted(
        requestDate: _fmt(_requestDate),
        fromDate: _fmt(_dateRange.start),
        toDate: _fmt(_dateRange.end),
        leaveType: _leaveType,
        detail: _detailController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApplyLeaveBloc, ApplyLeaveState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          context.pop();
        } else if (state.apiStatus == ApiStatus.FAILURE) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? 'Something went wrong'),
              backgroundColor: AppColors.errorBright,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: context.white,
        appBar: CustomAppBar(title: 'Leave Application'),
        body: SingleChildScrollView(
          padding: context.pagePadding.copyWith(top: 20, bottom: 24),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              // ── Request Date ──
              _FormLabel('Request Date'),
              const SizedBox(height: 5),
              _DateField(text: _fmt(_requestDate), onTap: _pickRequestDate),
              const SizedBox(height: 16),

              // ── Leave Date Range ──
              _FormLabel('Leave Date(s)'),
              const SizedBox(height: 5),
              _DateField(
                text: '${_fmt(_dateRange.start)}  –  ${_fmt(_dateRange.end)}',
                icon: Iconsax.calendar_2,
                onTap: _pickDateRange,
              ),
              const SizedBox(height: 16),

              // ── Leave Type ──
              _FormLabel('Leave Type'),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: context.border),
                  borderRadius: .circular(8),
                  color: context.surface,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _leaveType,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: context.textSecondary,
                    ),
                    style: context.labelMedium.copyWith(
                      color: context.textPrimary,
                    ),
                    onChanged: (v) {
                      if (v != null) setState(() => _leaveType = v);
                    },
                    items: _leaveTypes
                        .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // ── Detail ──
              CustomTextFormField(
                label: 'Detail',
                boldLabel: true,
                labelFontSize: 13,
                labelColor: context.textPrimary,
                hintText: 'Describe your reason...',
                hintStyle: context.labelMedium.copyWith(
                  color: context.textSecondary,
                  fontWeight: .normal,
                ),
                controller: _detailController,
                maxLines: 5,
                fieldHeight: null,
                contentPadding: const EdgeInsets.all(12),
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 16),

              // ── Upload Documents ──
              _FormLabel('Documents'),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: _pickFiles,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  decoration: BoxDecoration(
                    borderRadius: .circular(12),
                    border: Border.all(
                      color: context.primary.withValues(alpha: 0.35),
                      width: 1.5,
                    ),
                    color: context.primary.withValues(alpha: 0.03),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Iconsax.document_upload,
                        size: 32,
                        color: context.primary,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Upload documents',
                        style: context.labelMedium.copyWith(
                          color: context.primary,
                          fontWeight: .w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'PDF, Word, JPG, PNG',
                        style: context.labelSmall.copyWith(
                          color: context.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Picked file chips ──
              if (_pickedFiles.isNotEmpty) ...[
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: List.generate(_pickedFiles.length, (i) {
                    final file = _pickedFiles[i];
                    return Chip(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 0,
                      ),
                      label: Text(
                        file.name,
                        style: context.labelSmall.copyWith(
                          color: context.textPrimary,
                        ),
                        overflow: .ellipsis,
                        maxLines: 1,
                      ),
                      deleteIcon: const Icon(Icons.close, size: 14),
                      onDeleted: () => _removeFile(i),
                      backgroundColor: context.grey50,
                      side: BorderSide(color: context.border),
                      shape: RoundedRectangleBorder(borderRadius: .circular(8)),
                    );
                  }),
                ),
              ],

              BlocBuilder<ApplyLeaveBloc, ApplyLeaveState>(
                builder: (context, state) {
                  final loading = state.apiStatus == ApiStatus.LOADING;
                  return Padding(
                    padding: context.pagePadding.copyWith(top: 12, bottom: 20),
                    child: CustomButton(
                      text: 'Submit Application',
                      onPressed: _submit,
                      isLoading: loading,
                      radius: 12,
                      elevation: 0,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormLabel extends StatelessWidget {
  final String text;
  const _FormLabel(this.text);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: context.bodySmall.copyWith(
      color: context.textPrimary,
      fontSize: 13,
      fontWeight: .w600,
    ),
  );
}

class _DateField extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const _DateField({
    required this.text,
    this.icon = Iconsax.calendar_1,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: context.border),
          borderRadius: .circular(8),
          color: context.surface,
        ),
        child: Row(
          children: [
            Icon(icon, color: context.textSecondary, size: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: context.labelMedium.copyWith(color: context.textPrimary),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: context.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
