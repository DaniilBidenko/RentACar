import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rent_a_car_auto/api.dart';
import 'package:rent_a_car_auto/data/bronirovanie.dart';

class BronirovanieRepository {
  Future<List<Bronirovanie>> fethBron() async{
    try {
      final url = Uri.parse('${Api.API_URL}/bookings');
      final response = await http.post(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'User-Agent': 'Flutter Web Client', 
      },
      body: {
        
      }
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if(response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final bronirovanieResponse = BronirovanieResponse.fromJson(jsonData);

      if(bronirovanieResponse.success) {
        return bronirovanieResponse.data;
      } else {
        throw Exception('HTTP Error: ${response.statusCode} - ${response.body}');
      }
    } else {
      throw Exception('HTTP Error: ${response.statusCode} - ${response.body}');
    }
    } catch (e) {
      print('Error in fetchCars: $e');
      rethrow;
    }
  }
}