import 'package:flutter/material.dart';
import 'package:supa/models/categories_options.dart';
import 'package:supa/screens/screens.dart';

class AppRouter {
  //crear la ruta inicial estatica
  static const initialRoute = 'tabs';
  // crear un arreglo que contenga las rutas osea las screens
  static final categoriesOptions = <CategoriesOptions>[
    CategoriesOptions(
        route: 'ElectronicaScreen',
        icon: Icons.precision_manufacturing_sharp,
        name: 'Electronica',
        screen: const ElectronicaScreen(),
        image: '../assets/images/electronica2.jpg'),
    CategoriesOptions(
        route: 'coleccionables',
        icon: Icons.format_list_bulleted_add,
        name: 'Coleccionables',
        screen: const ColeccionablesScreen(),
        image: '../assets/images/coleccionables.jpeg'),
    CategoriesOptions(
        route: 'hogar',
        icon: Icons.home,
        name: 'Hogar & Jardín',
        screen: const HogarjardinScreen(),
        image: '../assets/images/hogar.jpeg'),
    CategoriesOptions(
        route: 'libros',
        icon: Icons.book_rounded,
        name: 'Libros',
        screen: const LibrosScreen(),
        image: '../assets/images/libros.jpeg'),
    CategoriesOptions(
        route: 'vehiculos',
        icon: Icons.car_rental_rounded,
        name: 'Vehículos',
        screen: const VehiculosScreen(),
        image: '../assets/images/vehiculos.jpeg'),
    CategoriesOptions(
        route: 'alert',
        icon: Icons.alarm,
        name: 'Donaciones',
        screen: const AlertaScreen(),
        image: '../assets/images/alerta.jpeg'),
  ];
  // crear un mapa que guarde las rutas en una funcion para despues implementarlas en la lista  de opciones
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'tabs': (BuildContext context) => const TabsScreen()});
    for (final option in categoriesOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

//crear ruta adicional para que se utilice cuando no se encuentra ruta inicial
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertaScreen(),
    );
  }
}
