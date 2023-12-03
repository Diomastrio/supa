import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> selectedCategories = [];
  String searchTerm = '';
  double minPrice = 0;
  double maxPrice = 100;
  bool isNew = false;
  bool isUsed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Filter Categories
            const Text('Categorías',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                FilterChip(
                  label: Text('Tecnología'),
                  onSelected: null,
                ),
                FilterChip(
                  label: Text('Donaciones'),
                  onSelected: null,
                ),
                FilterChip(
                  label: Text('Vehiculos'),
                  onSelected: null,
                ),
                FilterChip(
                  label: Text('Libros'),
                  onSelected: null,
                ),
                FilterChip(
                  label: Text('Hogar'),
                  onSelected: null,
                ),
                FilterChip(
                  label: Text('Coleccionables'),
                  onSelected: null,
                ),
              ],
            ),

            // Search Bar
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => searchTerm = value),
            ),

            // Filter Options
            const SizedBox(height: 20),
            const Text('Opciones de filtro',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Price Range
            const Text('Rango de precio'),
            RangeSlider(
              values: RangeValues(minPrice, maxPrice),
              min: 0.0,
              max: 100.0,
              onChanged: (values) => setState(() {
                minPrice = values.start;
                maxPrice = values.end;
              }),
            ),

            // Condition
            const Text('Estado'),
            Row(
              children: [
                Checkbox(
                  value: isNew,
                  onChanged: (value) => setState(() => isNew = value!),
                ),
                const Text('Nuevo'),
                const SizedBox(width: 20),
                Checkbox(
                  value: isUsed,
                  onChanged: (value) => setState(() => isUsed = value!),
                ),
                const Text('Usado'),
              ],
            ),

            // Filter Preview
            const SizedBox(height: 20),
            const Text('Vista previa del filtro'),

            // Filter Reset Button
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => setState(() {
                selectedCategories.clear();
                searchTerm = '';
                minPrice = 0;
                maxPrice = 100;
                isNew = false;
                isUsed = false;
              }),
              child: const Text('Restablecer filtros'),
            ),

            // Filter Confirmation Button
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Apply filters and navigate back to the main content page with the filtered results
              },
              child: const Text('Aplicar filtros'),
            ),
          ],
        ),
      ),
    );
  }
}
