import 'package:flutter/material.dart';
import 'package:supa/pages/account_page.dart';
import 'package:supa/routes/app_router.dart';
import 'package:supa/widgets/main_drawer.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          // Navigate to the screen specified by the identifier
          switch (identifier) {
            case 'meals':
              Navigator.pushNamed(context, '/meals');
              break;
            case 'filters':
              Navigator.pushNamed(context, '/filters');
              break;
          }
        },
      ),
      appBar: AppBar(
        title: const Text('Categorias'),
        backgroundColor: const Color.fromARGB(209, 29, 233, 182),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              // Navigate to the LoginScreen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AccountPage()));
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      Colors.grey), // Add a border for a card-like appearance
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  height: 120, // Set a fixed height for the image container
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage(AppRouter.categoriesOptions[index].image),
                      fit: BoxFit
                          .cover, // Ensure the image covers the entire container
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  AppRouter.categoriesOptions[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouter.categoriesOptions[index].route,
            );
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: AppRouter.categoriesOptions.length,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // onTap: ,
        // currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
