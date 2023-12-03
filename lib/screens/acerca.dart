import 'package:flutter/material.dart';

class AcercaScreen extends StatelessWidget {
  const AcercaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de Swapii'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Overview
            const Text(
              'Swapii: Tu plataforma de intercambio',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Swapii es una aplicación que te permite intercambiar productos de segunda mano de manera fácil, segura y eficiente. Conectamos a personas que desean vender o intercambiar sus artículos con otras que buscan comprar o adquirir productos de su interés.',
            ),

            // Mission and Values
            const SizedBox(height: 20),
            const Text(
              'Misión:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Fomentar la reutilización y el consumo sostenible a través de una plataforma de intercambio de artículos de segunda mano.',
            ),

            const SizedBox(height: 20),
            const Text(
              'Valores:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Flexible(
              child: Text(
                r'$$',
                semanticsLabel:
                    '- Conectividad: Construir una red sólida de usuarios que faciliten el intercambio de productos.',
              ),
            ),
            const Flexible(
              child: Text(
                r'$$',
                semanticsLabel:
                    '- Sostenibilidad: Promover el reciclaje y la reducción del consumo excesivo.',
              ),
            ),
            const Flexible(
              child: Text(
                r'$$',
                semanticsLabel:
                    '- Confianza: Brindar un entorno seguro y confiable para las transacciones.',
              ),
            ),
            const Flexible(
              child: Text(
                r'$$',
                semanticsLabel:
                    '- Comunidad: Fomentar la interacción y el intercambio entre los usuarios.',
              ),
            ),
            const Flexible(
              child: Text(
                r'$$',
                semanticsLabel:
                    '- Simplicidad: Ofrecer una interfaz intuitiva y fácil de usar para todos.',
              ),
            ),

            // Team Members
            const SizedBox(height: 20),
            const Text(
              'Equipo de desarrollo:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: Column(
                children: [
                  Image.asset('assets/images/Yi.jpg'),
                  const Text('Miguel Andy Contreras Esparza'),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Image.asset('assets/images/dark_swapii.png'),
                  const Text('Vargas'),
                ],
              ),
            ),
            // Contact Information
            const SizedBox(height: 20),
            const Text(
              'Contacto:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Correo electrónico: support@swapii.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Redes sociales:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook_rounded),
                  onPressed: () {
                    // Add Facebook link here
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.snapchat_rounded),
                  onPressed: () {
                    // Add Instagram link here
                  },
                ),
              ],
            ),
            // User Testimonials
            const SizedBox(height: 20),
            const Text(
              'Testimonios de usuarios:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              'No hay aun:(',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            // App Launch Story
            const SizedBox(height: 20),
            const Text(
              'Historia de lanzamiento:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
                'Swapii nació con la idea de crear una plataforma que facilitara el intercambio de artículos de segunda mano, fomentando la reutilización y reduciendo el impacto ambiental del consumo excesivo. Desde su lanzamiento, Swapii ha crecido exponencialmente, conectando a miles de usuarios y facilitando el intercambio de una amplia gama'),
          ],
        ),
      ),
    );
  }
}
