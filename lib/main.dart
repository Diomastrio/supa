import 'package:flutter/material.dart';
import 'package:supa/pages/account_page.dart';
import 'package:supa/pages/login_page.dart';
import 'package:supa/pages/page_splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://lskrofitofzcdrjvcywc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxza3JvZml0b2Z6Y2RyanZjeXdjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDEzOTY0OTgsImV4cCI6MjAxNjk3MjQ5OH0.5Qezr8U-WSfLX936oWBlv9Bmi0Zf9MmezhF8nYdv5j4',
    authFlowType: AuthFlowType.pkce,
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.teal[400],
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/account': (context) => const AccountPage(),
      },
    );
  }
}
