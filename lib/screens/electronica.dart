import 'package:flutter/material.dart';

class ElectronicaScreen extends StatelessWidget {
  const ElectronicaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      body: const Center(
        child: Text('Contenido del ELectronicaScreen'),
      ),
    );
  }
}
