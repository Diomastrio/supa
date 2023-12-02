import 'package:flutter/material.dart';

class VehiculosScreen extends StatelessWidget {
  const VehiculosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      body: const Center(
        child: Text('Contenido del VehiculosScreen'),
      ),
    );
  }
}
