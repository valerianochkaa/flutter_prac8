import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ЭКРАН 6. Авторизация
class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final items = List.generate(5, (index) => 'Ингредиент №${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Авторизация"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const Text(
            'Войдите в аккаунт!',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),

            const SizedBox(height: 26),

            ElevatedButton(
              onPressed: () {
                context.pushReplacement("/");
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(256, 56),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Войти в аккаунт"),
            ),
          ],
        ),
      ),
    );
  }
}