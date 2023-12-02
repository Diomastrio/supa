import 'package:flutter/material.dart';
import 'package:supa/screens/chat.dart';
import 'package:supa/screens/profile.dart';
import 'package:supa/screens/tabs.dart';

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
              icon: const Icon(Icons.account_circle),
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
                        builder: (context) => const ProfileScreen()));
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
        ], //children
      ),
    );
  }
}
