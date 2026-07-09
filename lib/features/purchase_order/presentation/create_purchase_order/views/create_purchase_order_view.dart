import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../purchase_order_exports.dart';

class CreatePurchaseOrderView extends StatelessWidget {
  const CreatePurchaseOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CreatePurchaseOrderBloc>(),
      child: const _CreatePurchaseOrderBody(),
    );
  }
}

class _CreatePurchaseOrderBody extends StatefulWidget {
  const _CreatePurchaseOrderBody();

  @override
  State<_CreatePurchaseOrderBody> createState() => _CreatePurchaseOrderBodyState();
}

class _CreatePurchaseOrderBodyState extends State<_CreatePurchaseOrderBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePurchaseOrderBloc, CreatePurchaseOrderState>(
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
            appBar: CustomAppBar(title: 'Create Purchase Order'),
            body: Form(
              key: _formKey,
              child: const Center(
                child: Text('CreatePurchaseOrder View'),
              ),
            ),
          ),
        );
      },
    );
  }
}
