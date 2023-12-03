import 'package:flutter/material.dart';

class Avatarin extends StatelessWidget {
  const Avatarin({
    super.key,
    this.imageUrl,
    required this.onUpload,
  });
  final String? imageUrl;
  final void Function(String imageUrl) onUpload;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: imageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  color: Colors.teal[300],
                  child: const Center(
                    child: Text('No hay imagen'),
                  ),
                ),
        ),
      ],
    );
  }
}
