import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/auth_bloc.dart';

class ClientAuthForm extends StatefulWidget {
  const ClientAuthForm({super.key});

  @override
  State<ClientAuthForm> createState() => _ClientAuthFormState();
}

class _ClientAuthFormState extends State<ClientAuthForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _bdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Номер телефона',
            ),
            controller: _phoneController,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Дата рождения',
            ),
            controller: _bdayController,
          ),
          const SizedBox(height: 22.0),

          FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                  LogInWithPhoneAndBDayEvent(
                    phone: _phoneController.text.trim(),
                    bday: _bdayController.text.trim(),
                  ),
                );
              }
            },
            child: const Text('Войти в аккаунт', style: TextStyle(color: Colors.white)),
          ),

        ],
      ),
    );
  }
}
