import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive/login_page.dart';
import 'package:flutter_application_1/responsive/signup_page.dart';

class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Login Button
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              label: const Text("Login", style: TextStyle(fontSize: 18)),
            ),

            const SizedBox(height: 20),

            // Signup Button
            ElevatedButton.icon(
              icon: const Icon(Icons.person_add),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                );
              },
              label: const Text("Signup", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
