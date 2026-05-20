import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../production_exports.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

class ProductionView extends StatelessWidget {
  const ProductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductionBloc>(),
      child: const _ProductionBody(),
    );
  }
}

class _ProductionBody extends StatefulWidget {
  const _ProductionBody();

  @override
  State<_ProductionBody> createState() => _ProductionBodyState();
}

class _ProductionBodyState extends State<_ProductionBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductionBloc, ProductionState>(
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
            appBar: CustomAppBar(title: AppConstants.productionLabel),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      // TODO: Add your UI widgets here
                      const Text(AppConstants.productionView),
                      heightBox(context.screenHeight * 0.05),
                      BlocBuilder<ProductionBloc, ProductionState>(
                        buildWhen: (p, n) => p.apiStatus != n.apiStatus,
                        builder: (context, state) {
                          return CustomButton(
                            isLoading: state.apiStatus == ApiStatus.LOADING,
                            text: AppConstants.submitBtn,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<ProductionBloc>()
                                    .add(ProductionSubmitted());
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
