import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supa/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  late final StreamSubscription<AuthState> _authSubscription;
  @override
  void initState() {
    super.initState();

    // Check if user is already logged in
    final currentUser = supabase.auth.currentUser;
    if (currentUser != null) {
      Navigator.of(context).pushReplacementNamed('/account');
    }

    // Subscribe to auth state changes
    _authSubscription = supabase.auth.onAuthStateChange.listen((event) {
      final session = event.session;
      if (session != null) {
        Navigator.of(context).pushReplacementNamed('/account');
      }
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   _authSubscription = supabase.auth.onAuthStateChange.listen((event) {
  //     final session = event.session;
  //     if (session != null) {
  //       Navigator.of(context).pushReplacementNamed('/account');
  //     }
  //   });
  // }

  @override
  void dispose() {
    _emailController.dispose();
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
      ),
      body: ListView(children: [
        const Padding(padding: EdgeInsets.all(12)),
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(label: Text('correo electronico')),
        ),
        const SizedBox(
          height: 12,
        ),
        // ElevatedButton(
        //   onPressed: () async {
        //     try {
        //       final email = _emailController.text.trim();
        //       await supabase.auth.signInWithOtp(
        //         email: email,
        //         emailRedirectTo:
        //             'io.supabase.flutterquickstart://login-callback/',
        //       );
        //       if (mounted) {
        //         ScaffoldMessenger.of(context).showSnackBar(
        //             const SnackBar(content: Text('Revisa tu inbox')));
        //       }
        //     } on AuthException catch (error) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(
        //           content: Text(error.message),
        //           backgroundColor: Theme.of(context).colorScheme.error,
        //         ),
        //       );
        //     }
        //     (error) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(
        //           content: const Text('Se produjo un error intentalo denuevo.'),
        //           backgroundColor: Theme.of(context).colorScheme.error,
        //         ),
        //       );
        //     };
        //   },
        //   child: const Text('Login'),
        // ),
        ElevatedButton(
          onPressed: () async {
            // Check if user is already logged in
            final currentUser = supabase.auth.currentUser;
            if (currentUser != null) {
              return; // Prevent sign-in if already logged in
            }

            // Attempt sign-in with OTP
            try {
              final email = _emailController.text.trim();
              await supabase.auth.signInWithOtp(
                email: email,
                emailRedirectTo:
                    'io.supabase.flutterquickstart://login-callback/',
              );

              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Revisa tu inbox')));
              }
            } on AuthException catch (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error.message),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            } catch (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Se produjo un error intentalo denuevo.'),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            }
          },
          child: const Text('Login'),
        ),
      ]),
    );
  }
}
