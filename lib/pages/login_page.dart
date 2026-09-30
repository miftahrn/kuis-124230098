import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../root.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String usernameBenar = 'miftah';
  final String passwordBenar = '124230098';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (username == usernameBenar && password == passwordBenar) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RootPage()),
      );
    } else {
      String pesan = 'Username atau password salah.';
      if (username.isEmpty || password.isEmpty) {
        pesan = 'Username dan password wajib diisi.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(pesan),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Pokemon App'), backgroundColor: Colors.yellow),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.catching_pokemon, size: 80, color: Colors.black),
              const SizedBox(height: 16),
              Text(
                'Masuk ke Pokemon App',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _login,
                icon: const Icon(Icons.login),
                label: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}