import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../purchase_order_exports.dart';

class PurchaseOrderView extends StatelessWidget {
  const PurchaseOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PurchaseOrderBloc>(),
      child: const _PurchaseOrderBody(),
    );
  }
}

class _PurchaseOrderBody extends StatefulWidget {
  const _PurchaseOrderBody();

  @override
  State<_PurchaseOrderBody> createState() => _PurchaseOrderBodyState();
}

class _PurchaseOrderBodyState extends State<_PurchaseOrderBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PurchaseOrderBloc, PurchaseOrderState>(
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
            appBar: CustomAppBar(title: 'PurchaseOrder'),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      // TODO: Add your UI widgets here
                      const Text('PurchaseOrder View'),
                      heightBox(context.screenHeight * 0.05),
                      BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
                        buildWhen: (p, n) => p.apiStatus != n.apiStatus,
                        builder: (context, state) {
                          return CustomButton(
                            isLoading: state.apiStatus == ApiStatus.LOADING,
                            text: 'Submit',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<PurchaseOrderBloc>()
                                    .add(PurchaseOrderSubmitted());
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
