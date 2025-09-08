import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../state/auth_bloc.dart';

class CheckSmsCodePage extends StatefulWidget {
  const CheckSmsCodePage({super.key});

  @override
  State<CheckSmsCodePage> createState() => _CheckSmsCodePageState();
}

class _CheckSmsCodePageState extends State<CheckSmsCodePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Введите код'),
      body: Padding(
        padding: EdgeInsets.all(22),
        child: Column(
          children: [

            const SizedBox(height: 22),
            Pinput(
              length:6,
              onCompleted: (value) {
                context.read<AuthBloc>().add(CheckSmsCodeEvent(smsCode: value));
              },
            )
          ],
        )
      ),
    );
  }

}
