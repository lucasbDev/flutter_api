import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PokedexPage(),
    );
  }
}

class PokedexPage extends StatefulWidget {
  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  String pokemonName = "Loading...";

  void fetchPokemon() async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        pokemonName = data['name'];
      });
    } else {
      setState(() {
        pokemonName = "Falha";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPokemon(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pokemon Name:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              pokemonName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
