import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Reset link sent to email!')));
                Navigator.pop(context);
              },
              child: const Text('Send to email'),
            )
          ],
        ),
      ),
    );
  }
}