import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/compact_date_picker.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../blocs/apply_overtime_bloc.dart';
import '../blocs/apply_overtime_event.dart';
import '../blocs/apply_overtime_state.dart';

const _monthNames = [
  'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
];

String _fmt(DateTime d) =>
    '${d.day.toString().padLeft(2, '0')}-${_monthNames[d.month - 1]}-${d.year}';

class ApplyOvertimeView extends StatelessWidget {
  const ApplyOvertimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ApplyOvertimeBloc>(),
      child: const _ApplyOvertimeBody(),
    );
  }
}

class _ApplyOvertimeBody extends StatefulWidget {
  const _ApplyOvertimeBody();

  @override
  State<_ApplyOvertimeBody> createState() => _ApplyOvertimeBodyState();
}

class _ApplyOvertimeBodyState extends State<_ApplyOvertimeBody> {
  DateTime _date = DateTime.now();
  String _overtimeType = 'Pre-Approved';
  final _hoursController = TextEditingController();
  final _reasonController = TextEditingController();

  static const _overtimeTypes = ['Pre-Approved', 'Emergency', 'Weekend'];

  @override
  void dispose() {
    _hoursController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showCompactDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _date = picked);
  }

  void _submit() {
    final hours = double.tryParse(_hoursController.text.trim());

    if (hours == null || hours <= 0) {
      AppToastsUtils.showErrorTop(context, 'Please enter valid hours');
      return;
    }

    context.read<ApplyOvertimeBloc>().add(ApplyOvertimeSubmitted(
          date: _fmt(_date),
          hours: hours,
          overtimeType: _overtimeType,
          reason: _reasonController.text.trim(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApplyOvertimeBloc, ApplyOvertimeState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          context.pop();
        } else if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(
              context, state.message ?? AppConstants.somethingWentWrong);
        }
      },
      child: Scaffold(
        backgroundColor: context.white,
        appBar: const CustomAppBar(title: 'Overtime Request'),
        body: SingleChildScrollView(
          padding: context.pagePadding.copyWith(top: 20, bottom: 32),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              // ── Date ──
              _FormLabel('Date'),
              const SizedBox(height: 6),
              _DateField(text: _fmt(_date), onTap: _pickDate),
              const SizedBox(height: 16),

              // ── Overtime Type ──
              _FormLabel('Overtime Type'),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: context.border),
                  borderRadius: .circular(8),
                  color: context.surface,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _overtimeType,
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down_rounded,
                        color: context.textSecondary),
                    style: context.labelMedium.copyWith(color: context.textSecondary),
                    onChanged: (v) {
                      if (v != null) setState(() => _overtimeType = v);
                    },
                    items: _overtimeTypes
                        .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // ── Hours ──
              CustomTextFormField(
                label: 'Hours',
                boldLabel: true,
                labelFontSize: 13,
                labelColor: context.textPrimary,
                hintText: 'e.g. 2.5',
                controller: _hoursController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 16),

              // ── Reason ──
              CustomTextFormField(
                label: 'Reason',
                boldLabel: true,
                labelFontSize: 13,
                labelColor: context.textPrimary,
                hintText: 'Describe your reason...',
                hintStyle: context.labelMedium.copyWith(
                  color: context.textSecondary,
                  fontWeight: .normal,
                ),
                controller: _reasonController,
                maxLines: 5,
                fieldHeight: null,
                contentPadding: const EdgeInsets.all(12),
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 24),

              BlocBuilder<ApplyOvertimeBloc, ApplyOvertimeState>(
                builder: (context, state) => CustomButton(
                  text: 'Submit Request',
                  onPressed: _submit,
                  isLoading: state.apiStatus == ApiStatus.LOADING,
                  radius: 12,
                  elevation: 0,
                ),
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
  final VoidCallback onTap;
  const _DateField({required this.text, required this.onTap});

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
            Icon(Iconsax.calendar_1, color: context.textSecondary, size: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: context.labelMedium.copyWith(color: context.textSecondary),
              ),
            ),
            Icon(Icons.keyboard_arrow_down_rounded,
                color: context.textSecondary, size: 20),
          ],
        ),
      ),
    );
  }
}
