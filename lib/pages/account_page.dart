import 'package:flutter/material.dart';
import 'package:supa/components/avatar.dart';
import 'package:supa/main.dart';
import 'package:supa/screens/tabs.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _usernameController = TextEditingController();
  final _websiteController = TextEditingController();
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _getInitialProfile();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  Future<void> _getInitialProfile() async {
    final userId = supabase.auth.currentUser!.id;
    final data =
        await supabase.from('profiles').select().eq('id', userId).single();
    if (mounted) {
      setState(() {
        _usernameController.text = data['username']?.toString() ?? '';
        _websiteController.text = data['website']?.toString() ?? '';
        _imageUrl = data['avatar_url']?.toString() ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina de cuenta'),
        actions: [
          IconButton(
            onPressed: () async {
              await supabase.auth.signOut();
              Navigator.of(context).pushReplacementNamed('/login');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        children: [
          Avatar(
              imageUrl: _imageUrl,
              onUpload: (imageUrl) async {
                setState(() {
                  _imageUrl = imageUrl;
                });
                final userId = supabase.auth.currentUser!.id;
                await supabase
                    .from('profiles')
                    .update({'avatar_url': imageUrl}).eq('id', userId);
              }),
          const SizedBox(
            height: 12,
          ),
          const Padding(padding: EdgeInsets.all(12)),
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(label: Text('nombre de usuario')),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _websiteController,
            decoration: const InputDecoration(label: Text('sitio')),
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () async {
              final username = _usernameController.text.trim();
              final website = _websiteController.text.trim();
              final userId = supabase.auth.currentUser!.id;
              await supabase.from('profiles').update({
                'username': username,
                'website': website,
              }).eq('id', userId);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Tus datos han sido guardados')));
              }
            },
            child: const Text('guardar'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TabsScreen()));
            },
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
