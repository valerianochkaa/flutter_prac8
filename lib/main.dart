import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'auth_screen.dart';
import 'recipes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: "/pageRecipes",
        builder: (context, state) => const RecipesScreen(),
      ),
      GoRoute(
        path: "/pageAuth",
        builder: (context, state) => AuthScreen(),
      ),
    ],
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Кулинарные рецепты',
        debugShowCheckedModeBanner: false,
        routerConfig: _router
    );
  }
}

// ЭКРАН 1. Главный экран
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static List<String> imageUrls = [
    'https://elementaree.ru/recipes/images/catalog/1937-desktop.jpg',
    'https://elementaree.ru/recipes/images/catalog/1938-desktop.jpg',
    'https://elementaree.ru/recipes/images/catalog/1939-desktop.jpg',
    'https://elementaree.ru/recipes/images/catalog/1941-desktop.jpg',
    'https://elementaree.ru/recipes/images/catalog/1948-desktop.jpg',
    'https://elementaree.ru/recipes/images/catalog/1945-desktop.jpg',
  ];

  static List<String> categories = [
    'Завтраки',
    'Обед',
    'Ужин',
    'Фастфуд',
    'Салаты',
    'Десерты',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кулинарные рецепты'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Добро пожаловать!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 26),
            for (int i = 0; i < imageUrls.length; i += 3)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  (i + 3 <= imageUrls.length) ? 3 : imageUrls.length - i,
                      (index) {
                    int currentIndex = i + index;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 116,
                            height: 116,
                            child: CachedNetworkImage(
                              imageUrl: imageUrls[currentIndex],
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categories[currentIndex],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

            const SizedBox(height: 56),

            ElevatedButton(
              onPressed: () {
                context.push("/pageRecipes");
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(256, 56),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Посмотреть рецепты"),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                context.pushReplacement("/pageAuth");
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(256, 56),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Выйти из аккаунта"),
            ),
          ],
        ),
      ),
    );
  }
}
