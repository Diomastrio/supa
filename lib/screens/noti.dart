import 'package:flutter/material.dart';

class NotiScreen extends StatelessWidget {
  const NotiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Notification List
          const Text(
            'Notificaciones recientes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          _notificationListMock(),

          // Notification Filters
          const SizedBox(height: 20),
          const Text(
            'Filtros de notificaciones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          _notificationFiltersMock(),

          // Notification Settings
          const SizedBox(height: 20),
          const Text(
            'Configuración de notificaciones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          _notificationSettingsMock(),
        ],
      ),
    );
  }
}

// Mock components for Notification List, Notification Filters, and Notification Settings
Widget _notificationListMock() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 3,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('Notificación #${index + 1}'),
        subtitle: const Text('Mensaje de notificación'),
        trailing: const Icon(Icons.notifications),
      );
    },
  );
}

Widget _notificationFiltersMock() {
  return Row(
    children: [
      const Text('Filtrar por categoría:'),
      const SizedBox(width: 10),
      DropdownButton<String>(
        value: 'Todos',
        items: const [
          DropdownMenuItem(
            value: 'Todos',
            child: Text('Todos'),
          ),
          DropdownMenuItem(
            value: 'Mensajes',
            child: Text('Mensajes'),
          ),
          DropdownMenuItem(
            child: Text('Actualizaciones de anuncios'),
          ),
          DropdownMenuItem(
            value: 'Promociones',
            child: Text('Promociones'),
          ),
        ],
        onChanged: (value) {},
      ),
    ],
  );
}

Widget _notificationSettingsMock() {
  return const Column(
    children: [
      CheckboxListTile(
        title: Text('Habilitar notificaciones de mensajes'),
        value: true,
        onChanged: null,
      ),
      CheckboxListTile(
        title: Text('Habilitar notificaciones de actualizaciones de anuncios'),
        value: true,
        onChanged: null,
      ),
      CheckboxListTile(
        title: Text('Habilitar notificaciones de promociones'),
        value: true,
        onChanged: null,
      ),
    ],
  );
}
