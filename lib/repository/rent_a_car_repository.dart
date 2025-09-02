import 'dart:convert';
import 'package:rent_a_car_auto/api.dart';
import 'package:rent_a_car_auto/data/rent_a_car_model.dart';
import 'package:http/http.dart' as http;

class RentACarRepository {
  Future<List<RentACarModel>> fethModel() async{
    try {
      final url = Uri.parse('${Api.API_URL}/cars/available');
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
      final carsResponse = CarsResponse.fromJson(jsonData);
      print(jsonData);
      if (carsResponse.success) {
        return carsResponse.data;
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