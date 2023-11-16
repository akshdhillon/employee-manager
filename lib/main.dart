import 'package:employee_manager/features/login/bloc/bloc.dart';
import 'package:employee_manager/features/settings/bloc/bloc.dart';
import 'package:employee_manager/features/settings/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/dashboard/bloc/bloc.dart';
import 'features/dashboard/pages/dashboard_page.dart';
import 'features/login/pages/login_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (c) => LoginValidationBloc(),
        ),
        BlocProvider(
          create: (c) => EmployeeListingBloc()..add(FetchEmployeesEvent()),
        ),
        BlocProvider(
          create: (c) => SettingsBloc(),
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
      title: 'Employee Dashboard App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      initialRoute: SettingsPage.route,
      routes: {
        LoginPage.route: (_) => const LoginPage(),
        DashboardPage.route: (_) => const DashboardPage(),
        SettingsPage.route: (_) => const SettingsPage(),
      },
    );
  }
}
