import 'package:flutter/material.dart';
import 'package:supa/screens/screens.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(235, 84, 231, 150),
                  Color.fromARGB(200, 118, 248, 198)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.autorenew_sharp,
                  size: 48,
                  color: Color.fromARGB(162, 0, 0, 0),
                ),
                const SizedBox(width: 18),
                Text(
                  'Swapii',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.sensor_occupied_outlined),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
            ),
            title: const Text('Perfil'),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.production_quantity_limits),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TabsScreen()));
              },
            ),
            title: const Text('Categorias'),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FilterScreen()));
              },
            ),
            title: const Text('Filtros'),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.chat_rounded),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatScreen()));
              },
            ),
            title: const Text('Mensajes'),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.settings_accessibility_sharp),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotiScreen()));
              },
            ),
            title: const Text('Notificaciones'),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.support_agent_rounded),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AyudaScreen()));
              },
            ),
            title: const Text('Ayuda y Soporte'),
          ),
          ListTile(
            leading: IconButton(
              icon: const Icon(Icons.business_rounded),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AcercaScreen()));
              },
            ),
            title: const Text('Acerca de Swapii'),
          ),
        ], //children
      ),
    );
  }
}
