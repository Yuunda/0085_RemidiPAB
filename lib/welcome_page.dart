import 'package:flutter/material.dart';
import 'main_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://images.unsplash.com/photo-1504711434969-e33886168f5c?w=400', height: 200),
            const SizedBox(height: 20),
            const Text(
              'Welcome to SpaceNews Core\nApplication',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage())),
              child: const Text('Masuk ke Dashboard'),
            )
          ],
        ),
      ),
    );
  }
}