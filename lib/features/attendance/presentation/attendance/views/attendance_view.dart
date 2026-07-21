import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../attendance_exports.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AttendanceBloc>(),
      child: const _AttendanceBody(),
    );
  }
}

class _AttendanceBody extends StatefulWidget {
  const _AttendanceBody();

  @override
  State<_AttendanceBody> createState() => _AttendanceBodyState();
}

class _AttendanceBodyState extends State<_AttendanceBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceBloc, AttendanceState>(
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
            appBar: CustomAppBar(title: 'Attendance'),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      // TODO: Add your UI widgets here
                      const Text('Attendance View'),
                      heightBox(context.screenHeight * 0.05),
                      BlocBuilder<AttendanceBloc, AttendanceState>(
                        buildWhen: (p, n) => p.apiStatus != n.apiStatus,
                        builder: (context, state) {
                          return CustomButton(
                            isLoading: state.apiStatus == ApiStatus.LOADING,
                            text: 'Submit',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<AttendanceBloc>()
                                    .add(AttendanceSubmitted());
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
