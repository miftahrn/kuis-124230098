import 'package:flutter/material.dart';

import '../data/pokemon_data.dart';
import '../models/pokemon.dart';
import 'detail_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openDetailPage(BuildContext context, Pokemon pokemon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(pokemon: pokemon),
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pokemon'),
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = pokemonList[index];
          return ListTile(
            leading: Image.network(pokemon.image),
            title: Text(pokemon.name),
            subtitle: Text(pokemon.types.join(', ')),
            onTap: () => _openDetailPage(context, pokemon),
          );
        },
      ),
    );
  }
}