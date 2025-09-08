import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/single_child_widget.dart';

import '_features/auth/state/auth_bloc.dart';
import 'di/app_provider_wrapper.dart';
import 'routing/app_router.dart';
import 'routing/auth_listener.dart';
import 'theme/theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    AppProviderWrapper(
      child: bloc.MultiBlocProvider(
        providers: <SingleChildWidget>[
          bloc.BlocProvider<AuthBloc>(
            create: (BuildContext context) {
              return AuthBloc(authRepository: context.read())..add(CheckAuthEvent());
            }
          ),
        ],
        child: provider.ChangeNotifierProvider<AuthListener>(
          create: (BuildContext context) =>
            AuthListener(bloc.BlocProvider.of<AuthBloc>(context).stream),
          child: const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(authListener: context.read<AuthListener>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _appRouter.config,
      supportedLocales: const <Locale>[Locale('ru')],
      locale: const Locale('ru'),
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: themeDate,
    );
  }
}
