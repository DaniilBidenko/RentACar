import 'package:dio/dio.dart';
import 'package:rent_a_car_auto/api.dart';
import 'package:rent_a_car_auto/data/rent_a_car_model.dart';

class RentACarRepository {
  Future<RentACarModel> fethModel() async{
    final dio = Dio();
    final repository = await dio.get('${Api.API_URL}cars/available');
    if (repository.statusCode == 200) {
      return RentACarModel.fromJson(repository.data);
    } else {
      throw Exception(
        'Ошибка загрузки курса'
      );
    }
  }
}