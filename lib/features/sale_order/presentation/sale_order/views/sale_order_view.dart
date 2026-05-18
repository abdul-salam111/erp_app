import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../sale_order_exports.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

class SaleOrderView extends StatelessWidget {
  const SaleOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SaleOrderBloc>(),
      child: const _SaleOrderBody(),
    );
  }
}

class _SaleOrderBody extends StatefulWidget {
  const _SaleOrderBody();

  @override
  State<_SaleOrderBody> createState() => _SaleOrderBodyState();
}

class _SaleOrderBodyState extends State<_SaleOrderBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SaleOrderBloc, SaleOrderState>(
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
            appBar: CustomAppBar(title: AppConstants.saleOrderTitle),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      // TODO: Add your UI widgets here
                      const Text(AppConstants.saleOrderView),
                      heightBox(context.screenHeight * 0.05),
                      BlocBuilder<SaleOrderBloc, SaleOrderState>(
                        buildWhen: (p, n) => p.apiStatus != n.apiStatus,
                        builder: (context, state) {
                          return CustomButton(
                            isLoading: state.apiStatus == ApiStatus.LOADING,
                            text: AppConstants.submitBtn,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<SaleOrderBloc>()
                                    .add(SaleOrderSubmitted());
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
