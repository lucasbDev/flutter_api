import 'package:http/http.dart' as http;
import 'dart:convert';

class PokedexApi {
  final String baseUrl = "https://pokeapi.co/api/v2";

  Future<Map<String, dynamic>> fetchPokemon(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$id/'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha');
    }
  }
}
