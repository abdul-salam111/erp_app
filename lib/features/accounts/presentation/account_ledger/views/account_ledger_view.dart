import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../accounts_exports.dart';

class AccountLedgerView extends StatelessWidget {
  const AccountLedgerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AccountLedgerBloc>(),
      child: const _AccountLedgerBody(),
    );
  }
}

class _AccountLedgerBody extends StatelessWidget {
  const _AccountLedgerBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountLedgerBloc, AccountLedgerState>(
      listenWhen: (prev, curr) => prev.apiStatus != curr.apiStatus,
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(title: AppConstants.accountLedgerLabel),
        body: const Center(
          child: Text(AppConstants.accountLedgerLabel),
        ),
      ),
    );
  }
}
