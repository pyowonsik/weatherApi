import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapi/api/api.dart';
import 'package:weatherapi/api/api_keys.default.dart';
import 'package:weatherapi/repositories/api_error.dart';

class User {
  final String name;
  final String email;

  const User({required this.name, required this.email});
}

class AuthRepository extends StateNotifier<User?> {
  AuthRepository({required this.api, required this.client}) : super(null);
  final OpenWeatherMapAPI api;
  final http.Client client;

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return builder(data);
        case 401:
          throw const APIError.invalidApiKey();
        case 404:
          throw const APIError.notFound();
        default:
          throw const APIError.unknown();
      }
    } on SocketException catch (_) {
      throw const APIError.noInternetConnection();
    }
  }

  Future<void> login(String email, String password) async {
    // state = const User(name: "name", email: "email");
  }

  Future<void> logout() async {
    // state = null;
  }
}

/// Providers used by rest of the app
final authRepositoryProvider =
    StateNotifierProvider<AuthRepository, User?>((ref) {
  /// Use the API key passed via --dart-define,
  /// or fallback to the one defined in api_keys.dart
  // set key to const
  const apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: APIKeys.openWeatherAPIKey,
  );

  return AuthRepository(
    api: OpenWeatherMapAPI(apiKey),
    client: http.Client(),
  );
});
