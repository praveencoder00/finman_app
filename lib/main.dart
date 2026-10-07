import 'package:finman_app/pages/add_expense_page.dart';
import 'package:finman_app/pages/home_page.dart';
import 'package:finman_app/pages/nav_page.dart';
import 'package:finman_app/pages/overview_page.dart';
import 'package:finman_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinMan',
      theme: AppTheme.lightTheme,
      home:  NavPage(),
    );
  }
}
