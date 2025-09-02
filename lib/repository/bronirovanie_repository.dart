import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rent_a_car_auto/api.dart';
import 'package:rent_a_car_auto/data/bronirovanie.dart';

class BronirovanieRepository {
  Future<List<Bronirovanie>> fethBron() async{
    try {
      final url = Uri.parse('${Api.API_URL}/bookings');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'User-Agent': 'Flutter Web Client',
      }
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print(response);

    if(response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final bronirovanieResponse = BronirovanieResponse.fromJson(jsonData);
      if(bronirovanieResponse.success) {
         print('Данные пришли успешно');
         print(bronirovanieResponse.data);
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

  Future<bool> createBooking(BronirovanieCustomer customer) async {
    try {
      final url = Uri.parse('${Api.API_URL}/bookings');
      
      // Конвертируем BronirovanieCustomer в JSON
      final Map<String, dynamic> requestData = {
        'customer': {
          'firstName': customer.firstName,
          'lastName': customer.lastName,
          'phone': customer.phone,
        },
        'booking': {
          'startDate': customer.startDate.toIso8601String(),
          'endDate': customer.endDate.toIso8601String(),
          'startTime': '${customer.startTime.hour.toString().padLeft(2, '0')}:${customer.startTime.minute.toString().padLeft(2, '0')}',
          'endTime': '${customer.endTime.hour.toString().padLeft(2, '0')}:${customer.endTime.minute.toString().padLeft(2, '0')}',
          'comment': customer.comment,
        }
      };
      print(requestData);
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'User-Agent': 'Flutter Web Client',
        },
        body: json.encode(requestData),
      );

      print('Create booking response status: ${response.statusCode}');
      print('Create booking response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = json.decode(response.body);
        print(jsonData);
        // Возвращаем true если запрос успешен
        return jsonData['success'] == true;
      } else {
        throw Exception('HTTP Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error in createBooking: $e');
      rethrow;
    }
  }
}