import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../accounts_exports.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AccountsBloc>(),
      child: const _AccountsBody(),
    );
  }
}

class _AccountsBody extends StatefulWidget {
  const _AccountsBody();

  @override
  State<_AccountsBody> createState() => _AccountsBodyState();
}

class _AccountsBodyState extends State<_AccountsBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountsBloc, AccountsState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(context, AppConstants.successSuccessMsg);
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      builder: (context, state) {
        return UnfocusWrapper(
          child: Scaffold(
            appBar: CustomAppBar(title: AppConstants.accountsLabel),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      const Text(AppConstants.accountsView),
                      heightBox(context.screenHeight * 0.05),
                      BlocBuilder<AccountsBloc, AccountsState>(
                        buildWhen: (p, n) => p.apiStatus != n.apiStatus,
                        builder: (context, state) {
                          return CustomButton(
                            isLoading: state.apiStatus == ApiStatus.LOADING,
                            text: AppConstants.submitBtn,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AccountsBloc>().add(
                                  AccountsSubmitted(),
                                );
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
