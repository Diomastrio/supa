import 'package:flutter/material.dart';

class AlertaScreen extends StatelessWidget {
  const AlertaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      body: const Center(
        child: Text('Contenido del AlertaScreen'),
      ),
    );
  }
}
