import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';

class CreditManagementView extends StatelessWidget {
  const CreditManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CreditManagementBloc>(),
      child: const _CreditManagementBody(),
    );
  }
}

class _CreditManagementBody extends StatefulWidget {
  const _CreditManagementBody();

  @override
  State<_CreditManagementBody> createState() => _CreditManagementBodyState();
}

class _CreditManagementBodyState extends State<_CreditManagementBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreditManagementBloc, CreditManagementState>(
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
            appBar: CustomAppBar(title: 'CreditManagement'),
            body: Form(
              key: _formKey,
              child: const Center(
                child: Text('CreditManagement View'),
              ),
            ),
          ),
        );
      },
    );
  }
}
