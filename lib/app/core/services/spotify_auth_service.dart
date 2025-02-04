import 'package:flutter_web_auth/flutter_web_auth.dart';

class SpotifyAuthService {
  static const String clientId = "7e418dfb8b9540e2a4c2cb4aa6a6340c";
  static const String redirectUri = "com.fuze";
  static const List<String> scopes = [
    "user-read-private",
    "user-read-email",
    "playlist-read-private"
  ];

  Future<String?> auth() async {
    final authUrl = Uri.https("accounts.spotify.com", "/authorize", {
      "client_id": clientId,
      "response_type": "token",
      "redirect_uri": redirectUri,
      "scope": scopes.join(" "),
    });
    try {
      final result = await FlutterWebAuth.authenticate(
        url: authUrl.toString(),
        callbackUrlScheme: "com.fuze",
      );

      print("auth result: $result");

      final token = Uri.parse(result)
          .fragment
          .split("&")
          .firstWhere((element) => element.startsWith("access_token="))
          .split("=")[1];

      return token;
    } catch (e) {
      print("Erro na autenticação: $e");
      return null;
    }
  }
}
