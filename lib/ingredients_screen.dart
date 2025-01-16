import 'package:flutter/material.dart';

// ЭКРАН 4. Список ингредиентов
class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  List<String> items = List.generate(5, (index) => 'Ингредиент №${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ингредиенты"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (items.isNotEmpty) {
                  items.removeAt(items.length - 1);
                }
              });
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                items.add("Ингредиент №${items.length + 1}");
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: (() {
            if (items.isEmpty) {
              return [
                const Center(
                  child: Text(
                    'Список пуст',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ];
            } else {
              return items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(item, style: const TextStyle(fontSize: 16)),
              )).toList();
            }
          }()),
        ),
      ),
    );
  }
}