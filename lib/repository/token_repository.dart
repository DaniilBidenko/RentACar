import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rent_a_car_auto/api.dart';
import 'package:rent_a_car_auto/data/token.dart';

class TokenRepository {
  Future<List<Token>> fethToken() async{
    try{
      final url = Uri.parse('${Api.API_URL}/admin/login');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'User-Agent': 'Flutter Web Client', 
      }
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if(response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final tokenResponse = TokenResponse.fromJson(jsonData);
      if(tokenResponse.success) {
        return tokenResponse.data;
      } else {
        throw Exception('HTTP Error: ${response.statusCode} - ${response.body}');
      }
    } else {
      throw Exception('HTTP Error: ${response.statusCode} - ${response.body}');
    }
    } catch (e) {
      print('Error in fetchToken: $e');
      rethrow;
    }
  }
}