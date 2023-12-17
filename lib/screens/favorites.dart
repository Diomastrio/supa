import 'package:flutter/material.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  FavoritosState createState() => FavoritosState();
}

class FavoritosState extends State<Favoritos> {
  final List<String> imagePaths = [
    'assets/images/alerta.jpeg',
    'assets/images/vehiculos.jpeg',
    'assets/images/libros.jpeg',
    'assets/images/hogar.jpeg',
    // Add more image paths as needed
  ];

  void removeItem(int index) {
    setState(() {
      imagePaths.removeAt(index);
    });
    // Show a snackbar when an item is removed
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Removido de favoritos'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePaths[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        removeItem(index);
                      },
                    ),
                    const Icon(
                      Icons.bookmark,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
