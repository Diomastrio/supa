import 'package:flutter/material.dart';

class LibrosScreen extends StatelessWidget {
  const LibrosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      body: const Center(
        child: Text('Contenido del LibrosScreen'),
      ),
    );
  }
}
