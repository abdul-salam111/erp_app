import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../scan_document_exports.dart';

class ScanDocumentView extends StatelessWidget {
  const ScanDocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ScanDocumentBloc>(),
      child: const _ScanDocumentBody(),
    );
  }
}

class _ScanDocumentBody extends StatefulWidget {
  const _ScanDocumentBody();

  @override
  State<_ScanDocumentBody> createState() => _ScanDocumentBodyState();
}

class _ScanDocumentBodyState extends State<_ScanDocumentBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanDocumentBloc, ScanDocumentState>(
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
            appBar: CustomAppBar(title: 'ScanDocument'),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      // TODO: Add your UI widgets here
                      const Text('ScanDocument View'),
                      heightBox(context.screenHeight * 0.05),
                      BlocBuilder<ScanDocumentBloc, ScanDocumentState>(
                        buildWhen: (p, n) => p.apiStatus != n.apiStatus,
                        builder: (context, state) {
                          return CustomButton(
                            isLoading: state.apiStatus == ApiStatus.LOADING,
                            text: 'Submit',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<ScanDocumentBloc>()
                                    .add(ScanDocumentSubmitted());
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
