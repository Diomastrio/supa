import 'package:flutter/material.dart';

class HogarjardinScreen extends StatelessWidget {
  const HogarjardinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      body: const Center(
        child: Text('Contenido del hogar_jardinScreen'),
      ),
    );
  }
}
