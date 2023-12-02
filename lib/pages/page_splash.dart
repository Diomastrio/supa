import 'package:flutter/material.dart';
import 'package:supa/main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    final session = supabase.auth.currentSession;
    if (!mounted) return;
    if (session != null) {
      Navigator.of(context).pushReplacementNamed('/account');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
// Exception has occurred.
// FlutterError (Could not find a generator for route RouteSettings("/login", null) in the _WidgetsAppState.
// Make sure your root app widget has provided a way to generate
// this route.
// Generators for routes are searched for in the following order:
//  1. For the "/" route, the "home" property, if non-null, is used.
//  2. Otherwise, the "routes" table is used, if it has an entry for the route.
//  3. Otherwise, onGenerateRoute is called. It should return a non-null value for any valid route not handled by "home" and "routes".
//  4. Finally if all else fails onUnknownRoute is called.
// Unfortunately, onUnknownRoute was not set.)