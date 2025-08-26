import 'package:rent_a_car_auto/client_token/api_client.dart';
import 'package:rent_a_car_auto/client_token/token_storage.dart';

class AuthApi {
  final ApiClient client;
  final TokenStorage storage;

  AuthApi(this.client, this.storage);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final res = await client.dio.post('/admin/login', data: {
      'email': email,
      'password': password
    }
  );
  final token = res.data['data']['token'] as String;
  return Map<String, dynamic>.from(res.data['data']);
  }

  Future<void> logout() async {
    await storage.clear();
  }
}
