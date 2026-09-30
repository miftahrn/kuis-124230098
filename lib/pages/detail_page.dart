import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class DetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name), backgroundColor: Colors.yellow),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                pokemon.image,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            Text('ID: ${pokemon.id}', style: const TextStyle(fontSize: 18)),
            Text('Name: ${pokemon.name}', style: const TextStyle(fontSize: 18)),
            Text('Types: ${pokemon.types.join(', ')}', style: const TextStyle(fontSize: 18)),
            Text('Height: ${pokemon.height}', style: const TextStyle(fontSize: 18)),
            Text('Weight: ${pokemon.weight}', style: const TextStyle(fontSize: 18)),
            Text('Ability: ${pokemon.ability}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}