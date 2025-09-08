import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../models/auth_user.dart';
import '../routers/check_sms_code_route.dart';
import '../state/auth_bloc.dart';
import 'client_auth_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _emailError = '';
  String _passwordError = '';
  bool _passwordVisible = false;

  UserType _userType = UserType.client;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (AuthState previous, AuthState current) => previous.status != current.status,
      listener: (BuildContext context, AuthState state) {
        if (state.status.isError) {
          showDialog<void>(
            context: context,
            builder: (BuildContext _) {
              return AlertDialog(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                title: Text(state.error, style: const TextStyle(color: Color(0xFFFF0066))),
                actions: <Widget>[
                  FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFF0066)),
                    onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                    child: const Text('Закрыть', style: TextStyle(color: Colors.white)),
                  ),
                ],
              );
            },
          );
        } else if(state.status.isSmsSanded) {
          context.goNamed(CheckSmsCodeRoute.name);
        }
      },
      builder: (BuildContext context, AuthState state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: MediaQuery.of(context).padding,
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 22.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    //todo make image const path
                    child: SvgPicture.asset('assets/images/tiamo_logo.svg', fit: BoxFit.fitWidth),
                  ),

                  const SizedBox(height: 44.0),

                  DropdownButtonFormField<UserType>(
                    value: UserType.client,
                    items: const <DropdownMenuItem<UserType>>[
                      DropdownMenuItem(value: UserType.client, child: Text('Пациент')),
                      DropdownMenuItem(value: UserType.doctor, child: Text('Доктор')),
                    ],
                    onChanged: (UserType? value) {
                      if (value != null) {
                        setState(() {
                          _userType = value;
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 16.0),
                  _getAuthForm(_userType)

                ],
              ),
            ),
          ),
        );
      },
    );
  }


  Widget _getAuthForm(UserType userType) {
    switch (userType) {
      case UserType.client:
        return const ClientAuthForm();
      case UserType.doctor:
        return _doctorForm();
      case UserType.sellerClient:
        return const ClientAuthForm();
    }

  }

  Widget _clientForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField()
        ]
      )
    );
  }

  Widget _doctorForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[


          TextFormField(
            decoration: InputDecoration(
              labelText: 'Логин',
              errorText: _emailError.isNotEmpty ? _emailError : null,
            ),
            controller: _loginController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Поле не может быть пустым';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _passwordController,
            obscureText: _passwordVisible,
            decoration: InputDecoration(
              labelText: 'Пароль',
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF8C8F95),
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Поле не может быть пустым';
              }
              return null;
            },
          ),
          const SizedBox(height: 22.0),
          FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                  LogInEvent(
                    login: _loginController.text.trim(),
                    password: _passwordController.text.trim(),
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
