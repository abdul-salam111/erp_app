import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/theme/theme_utils.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../blocs/apply_loan_bloc.dart';
import '../blocs/apply_loan_event.dart';
import '../blocs/apply_loan_state.dart';

class ApplyLoanView extends StatelessWidget {
  const ApplyLoanView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ApplyLoanBloc>(),
      child: const _ApplyLoanBody(),
    );
  }
}

class _ApplyLoanBody extends StatefulWidget {
  const _ApplyLoanBody();

  @override
  State<_ApplyLoanBody> createState() => _ApplyLoanBodyState();
}

class _ApplyLoanBodyState extends State<_ApplyLoanBody>
    with SingleTickerProviderStateMixin {
  String _loanType = 'Personal';
  final _amountController = TextEditingController();
  final _tenureController = TextEditingController();
  final _reasonController = TextEditingController();

  static const _loanTypes = ['Personal', 'Medical', 'Emergency', 'Education'];
  static const _offscreen = Offset(0, 0.06);
  static const _itemCount = 5;

  late final AnimationController _ctrl;
  late final List<Animation<double>> _fades;
  late final List<Animation<Offset>> _slides;

  Animation<double> _fade(double start, double end) => CurvedAnimation(
        parent: _ctrl,
        curve: Interval(start, end, curve: Curves.easeOut),
      );

  Animation<Offset> _slide(double start, double end) =>
      Tween<Offset>(begin: _offscreen, end: Offset.zero).animate(
        CurvedAnimation(
          parent: _ctrl,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        ),
      );

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    _fades = [for (int i = 0; i < _itemCount; i++) _fade(i * 0.08, 0.45 + i * 0.08)];
    _slides = [for (int i = 0; i < _itemCount; i++) _slide(i * 0.08, 0.45 + i * 0.08)];
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _amountController.dispose();
    _tenureController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  void _submit() {
    final amount = double.tryParse(_amountController.text.trim());
    final tenure = int.tryParse(_tenureController.text.trim());

    if (amount == null || amount <= 0) {
      AppToastsUtils.showErrorTop(context, 'Please enter a valid amount');
      return;
    }
    if (tenure == null || tenure <= 0) {
      AppToastsUtils.showErrorTop(context, 'Please enter a valid tenure');
      return;
    }

    context.read<ApplyLoanBloc>().add(ApplyLoanSubmitted(
          loanType: _loanType,
          amount: amount,
          tenureMonths: tenure,
          reason: _reasonController.text.trim(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApplyLoanBloc, ApplyLoanState>(
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
        appBar: const CustomAppBar(title: 'Loan Request'),
        body: SingleChildScrollView(
          padding: context.pagePadding.copyWith(top: 20, bottom: 32),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              // ── Loan Type ──
              _Animated(fade: _fades[0], slide: _slides[0], child: Column(
                crossAxisAlignment: .start,
                children: [
                  _FormLabel('Loan Type'),
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
                        value: _loanType,
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down_rounded,
                            color: context.textSecondary),
                        style: context.labelMedium.copyWith(color: context.textSecondary),
                        onChanged: (v) {
                          if (v != null) setState(() => _loanType = v);
                        },
                        items: _loanTypes
                            .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 16),

              // ── Amount ──
              _Animated(fade: _fades[1], slide: _slides[1], child: CustomTextFormField(
                label: 'Amount (PKR)',
                boldLabel: true,
                labelFontSize: 13,
                labelColor: context.textPrimary,
                hintText: 'e.g. 50000',
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              )),
              const SizedBox(height: 16),

              // ── Tenure ──
              _Animated(fade: _fades[2], slide: _slides[2], child: CustomTextFormField(
                label: 'Tenure (Months)',
                boldLabel: true,
                labelFontSize: 13,
                labelColor: context.textPrimary,
                hintText: 'e.g. 12',
                controller: _tenureController,
                keyboardType: TextInputType.number,
              )),
              const SizedBox(height: 16),

              // ── Reason ──
              _Animated(fade: _fades[3], slide: _slides[3], child: CustomTextFormField(
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
              )),
              const SizedBox(height: 24),

              _Animated(fade: _fades[4], slide: _slides[4], child:
                BlocBuilder<ApplyLoanBloc, ApplyLoanState>(
                  builder: (context, state) => CustomButton(
                    text: 'Submit Request',
                    onPressed: _submit,
                    isLoading: state.apiStatus == ApiStatus.LOADING,
                    radius: 12,
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Animated extends StatelessWidget {
  final Animation<double> fade;
  final Animation<Offset> slide;
  final Widget child;

  const _Animated({required this.fade, required this.slide, required this.child});

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: fade,
        child: SlideTransition(position: slide, child: child),
      );
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
