import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../state/auth_bloc.dart';

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
      listener: (BuildContext context, AuthState state) {
        if(state is AuthError) {
          showDialog<void>(
            context: context,
            builder: (BuildContext _) {
              return AlertDialog(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                title: Text(state.message, style: const TextStyle(color: Color(0xFFFF0066))),
                actions: <Widget>[
                  FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFF0066)),
                    onPressed: ()  => Navigator.of(context, rootNavigator: true).pop(),
                    child: const Text('Закрыть', style: TextStyle(color: Colors.white)),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (BuildContext context, AuthState state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: MediaQuery.of(context).padding,
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 22.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      //todo make image const path
                      child: SvgPicture.asset('assets/images/tiamo_logo.svg', fit: BoxFit.fitWidth)
                    ),
                    const SizedBox(height: 44.0),
                    Form(
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
                              if(value == null || value.isEmpty) {
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
                                icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: const Color(0xFF8C8F95)),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            validator: (String? value) {
                              if(value == null || value.isEmpty) {
                                return 'Поле не может быть пустым';
                              }
                              return null;
                            },

                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22.0),
                    FilledButton(
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(LogInEvent(login: _loginController.text.trim(), password: _passwordController.text.trim()));
                        }
                      },
                      child: state is AuthLoading ? const SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.0,
                        ),
                      ) : const Text('Войти в аккаунт', style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
