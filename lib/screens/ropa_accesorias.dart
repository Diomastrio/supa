import 'package:flutter/material.dart';

class RopaScreen extends StatelessWidget {
  const RopaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      body: const Center(
        child: Text('Contenido del RopaScreen'),
      ),
    );
  }
}
