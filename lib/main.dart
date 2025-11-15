import 'package:daar_project/app/theme/theme.dart';
import 'package:daar_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:daar_project/features/auth/presentation/pages/login_page.dart';
import 'package:daar_project/features/home/presentation/pages/home_page.dart';
import 'package:daar_project/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/app_user/app_user_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<AppUserCubit>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: BlocBuilder<AppUserCubit, AppUserState>(
        builder: (context, state) {
          debugPrint("STATO ATTUALE: $state");
          // Controlla se l'utente è loggato in base allo stato
          if (state is AppUserLoggedIn) {
            return const HomePage(); // O la tua pagina principale
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
