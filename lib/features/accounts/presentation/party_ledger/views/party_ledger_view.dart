import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../accounts_exports.dart';

class PartyLedgerView extends StatelessWidget {
  const PartyLedgerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PartyLedgerBloc>(),
      child: const _PartyLedgerBody(),
    );
  }
}

class _PartyLedgerBody extends StatefulWidget {
  const _PartyLedgerBody();

  @override
  State<_PartyLedgerBody> createState() => _PartyLedgerBodyState();
}

class _PartyLedgerBodyState extends State<_PartyLedgerBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PartyLedgerBloc, PartyLedgerState>(
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
            appBar: CustomAppBar(title: 'PartyLedger'),
            body: Form(
              key: _formKey,
              child: const Center(
                child: Text('PartyLedger View'),
              ),
            ),
          ),
        );
      },
    );
  }
}
