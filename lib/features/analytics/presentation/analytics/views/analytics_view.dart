import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../analytics_exports.dart';


class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AnalyticsBloc>(),
      child: const _AnalyticsBody(),
    );
  }
}

class _AnalyticsBody extends StatefulWidget {
  const _AnalyticsBody();

  @override
  State<_AnalyticsBody> createState() => _AnalyticsBodyState();
}

class _AnalyticsBodyState extends State<_AnalyticsBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnalyticsBloc, AnalyticsState>(
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.SUCCESS) {
          AppToastsUtils.showSuccessTop(
            context,
            AppConstants.successSuccessMsg,
          );
        }
        if (state.apiStatus == ApiStatus.FAILURE) {
          AppToastsUtils.showErrorTop(context, state.message.toString());
        }
      },
      builder: (context, state) {
        return UnfocusWrapper(
          child: Scaffold(
            appBar: CustomAppBar(title: AppConstants.analyticsLabel),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      const Text(AppConstants.analyticsView),
                      heightBox(context.screenHeight * 0.05),
                      BlocBuilder<AnalyticsBloc, AnalyticsState>(
                        buildWhen: (p, n) => p.apiStatus != n.apiStatus,
                        builder: (context, state) {
                          return CustomButton(
                            isLoading: state.apiStatus == ApiStatus.LOADING,
                            text: AppConstants.submitBtn,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AnalyticsBloc>().add(
                                  AnalyticsSubmitted(),
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
