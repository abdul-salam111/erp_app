import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../salary_mgmt_exports.dart';

class SalaryMgmtView extends StatelessWidget {
  const SalaryMgmtView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SalaryMgmtBloc>(),
      child: const _SalaryMgmtBody(),
    );
  }
}

class _SalaryMgmtBody extends StatefulWidget {
  const _SalaryMgmtBody();

  @override
  State<_SalaryMgmtBody> createState() => _SalaryMgmtBodyState();
}

class _SalaryMgmtBodyState extends State<_SalaryMgmtBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalaryMgmtBloc, SalaryMgmtState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(context, 'Success!');
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      builder: (context, state) {
        return UnfocusWrapper(
          child: Scaffold(
            appBar: CustomAppBar(title: 'SalaryMgmt'),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      // TODO: Add your UI widgets here
                      const Text('SalaryMgmt View'),
                      heightBox(context.screenHeight * 0.05),
                      BlocBuilder<SalaryMgmtBloc, SalaryMgmtState>(
                        buildWhen: (p, n) => p.apiStatus != n.apiStatus,
                        builder: (context, state) {
                          return CustomButton(
                            isLoading: state.apiStatus == ApiStatus.LOADING,
                            text: 'Submit',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<SalaryMgmtBloc>()
                                    .add(SalaryMgmtSubmitted());
                              }
                            },
                            radius: 10,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
