import 'package:flutter/material.dart';
import 'package:supa/components/avatarin.dart';
import 'package:supa/main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _getInitialProfile();
  }

  Future<void> _getInitialProfile() async {
    final userId = supabase.auth.currentUser!.id;
    final data =
        await supabase.from('profiles').select().eq('id', userId).single();
    if (mounted) {
      setState(() {
        _imageUrl = data['avatar_url']?.toString() ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Perfil'),
          backgroundColor: const Color.fromARGB(209, 29, 233, 182)),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0), // Add padding to the top
                child: Avatarin(
                  imageUrl: _imageUrl,
                  onUpload: (imageUrl) async {
                    setState(() {
                      _imageUrl = imageUrl;
                    });
                    final userId = supabase.auth.currentUser!.id;
                    await supabase
                        .from('profiles')
                        .update({'avatar_url': imageUrl}).eq('id', userId);
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 26.0,
                ),
              ),
              const SizedBox(
                height: 16,
                width: 10,
              ),
              const Text(
                'Lumqua Hagetatsu',
                style: TextStyle(
                  color: Color.fromARGB(
                      255, 100, 224, 177), // Change the color to black
                  fontSize: 24, // Increase font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Email: elder_lumqua@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const Text(
                'Teléfono:    +52 123 456 7890',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
                width: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.account_circle), // Change the icon
                    onPressed: () {
                      // Cambiar de cuenta
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.email),
                    onPressed: () {
                      // Change email
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
