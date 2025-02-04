import 'dart:convert';
import 'package:http/http.dart' as http;

class SpotifyApiService {
  Future<Map<String, dynamic>> getUser(String accessToken) async {
    final response = await http.get(
      Uri.parse("https://api.spotify.com/v1/me"),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Erro ao obter perfil: ${response.statusCode}");
    }
  }
}
