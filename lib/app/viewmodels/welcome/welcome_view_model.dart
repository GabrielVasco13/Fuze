import 'package:flutter/material.dart';
import 'package:fuze/app/core/services/spotify_api_service.dart';
import 'package:fuze/app/core/services/spotify_auth_service.dart';
import 'package:fuze/app/models/user_model.dart';

class WelcomeViewModel extends ChangeNotifier {
  final SpotifyAuthService _authService = SpotifyAuthService();
  final SpotifyApiService _apiService = SpotifyApiService();

  String? _token;
  UserModel? _user;

  String? get token => _token;
  UserModel? get user => _user;

  Future<void> login() async {
    _token = await _authService.auth();
    if (_token != null) {
      await fetchUserProfile();
    }
    notifyListeners();
  }

  Future<void> fetchUserProfile() async {
    if (_token == null) return;
    try {
      final userData = await _apiService.getUser(_token!);
      _user = UserModel.fromJson(userData);
      notifyListeners();
    } catch (e) {
      print("Erro ao buscar perfil: $e");
    }
  }
}
