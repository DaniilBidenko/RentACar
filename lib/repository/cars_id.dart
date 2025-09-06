import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rent_a_car_auto/api.dart';
import 'package:rent_a_car_auto/data/cars_id_model.dart';

class CarsId {
  Future<List<CarsIdModel>> fethIdModel() async{
    try {
      final url = Uri.parse('${Api.API_URL}/cars/:id');
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
        final carsIdResponse = CarsIdResponse.fromJson(jsonData);
        if(carsIdResponse.success) {
          return carsIdResponse.data;
        } else {
          throw Exception('HHTP Error: ${response.statusCode} - ${response.body}');
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