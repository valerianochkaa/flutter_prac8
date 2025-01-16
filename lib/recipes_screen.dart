import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';

// ЭКРАН 2. Список рецептов
class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  List<String> items = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    setState(() {
      isLoading = true;
    });

    try {
      items = await getRecipes();
    } catch (e) {
      print("Произошла ошибка при загрузке рецептов: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<List<String>> getRecipes() async {
    return await Future.delayed(const Duration(seconds: 2), () {
      return List.generate(5, (index) => 'Рецепт №${index + 1}');
    });
  }

  // Future<List<String>> getRecipes() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   throw Exception("Data loading error");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список рецептов'),
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
                items.add("Рецепт №${items.length + 1}");
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : items.isEmpty
            ? const Center(
              child: Text(
                'Список пуст',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  items[index],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 116),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(recipeName: items[index]),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Посмотреть рецепт"),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: items.length,
          padding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}



