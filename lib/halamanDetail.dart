// ignore: file_names
// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:quiz_praktpm/pokemon_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatelessWidget {
  final PokemonData pokemon;
  const HalamanDetail({Key? key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Image.network(pokemon.image),
            ),
            const SizedBox(height: 16),
            const Text('Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(
              pokemon.name,
            ),
            const SizedBox(height: 16),
            const Text('Type',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.type.map((type) => Text("$type ")).toList(),
            ),
            const SizedBox(height: 16),
            const Text('Weakness',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.weakness
                  .map((weakness) => Text("$weakness "))
                  .toList(),
            ),
            const SizedBox(height: 16),
            const Text('Previous Evolution',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.prevEvolution
                  .map((prevEvolution) => Text("$prevEvolution "))
                  .toList(),
            ),
            const SizedBox(height: 16),
            const Text('Next Evolution',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.nextEvolution
                  .map((nextEvolution) => Text("$nextEvolution "))
                  .toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _launchUrl(pokemon.wikiUrl),
        child: const Icon(Icons.info),
      ),
    );
  }
}

void _launchUrl(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw Exception('Could not launch $url');
  }
}
