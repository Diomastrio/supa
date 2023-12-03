import 'package:flutter/material.dart';

class AyudaScreen extends StatelessWidget {
  const AyudaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayuda'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          // Frequently Asked Questions (FAQ)
          Text(
            'Preguntas frecuentes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ExpansionTile(
            title: Text('¿Qué es Swapii?'),
            children: [
              Text(
                'Swapii es una plataforma de intercambio de artículos de segunda mano que te permite intercambiar tus productos usados con otros usuarios. Es una forma fácil, segura y sostenible de dar nueva vida a tus artículos y consumir de manera más responsable.',
              ),
            ],
          ),
          ExpansionTile(
            title: Text('¿Cómo funciona Swapii?'),
            children: [
              Text(
                'Para usar Swapii, crea una cuenta y luego publica tus artículos a la venta o intercambio. Cuando encuentres un artículo que te interese, puedes contactar con el vendedor para acordar un intercambio o compra. Swapii se encarga de facilitar la comunicación y el pago seguro de las transacciones.',
              ),
            ],
          ),
          ExpansionTile(
            title:
                Text('¿Qué tipos de artículos puedo intercambiar en Swapii?'),
            children: [
              Text(
                'Puedes intercambiar una amplia variedad de artículos de segunda mano en Swapii, incluyendo ropa, accesorios, electrónica, muebles, libros, juguetes y mucho más.',
              ),
            ],
          ),

          // Troubleshooting Guide
          SizedBox(height: 20),
          Text(
            'Guía de resolución de problemas',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),

          // Contact Support Options
          SizedBox(height: 20),
          Text(
            'Ponte en contacto con el soporte',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Si tienes alguna pregunta o problema con Swapii, no dudes en ponerte en contacto con nuestro equipo de soporte. Puedes enviarnos un correo electrónico a support@swapii.com o llamarnos al +1-888-555-1212.',
          ),
        ],
      ),
    );
  }
}
