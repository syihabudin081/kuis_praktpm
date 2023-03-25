// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:quiz_praktpm/halamanDetail.dart';
import 'package:quiz_praktpm/pokemon_data.dart';


class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
   body: GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
  
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    childAspectRatio: 0.75,
  ),
  itemCount: listPokemon.length,
  itemBuilder: (context, index) {
    final PokemonData pokemon = listPokemon[index];
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HalamanDetail(pokemon: pokemon)),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                pokemon.image,
                 width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                pokemon.name,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  },
),
    );
  }
}
