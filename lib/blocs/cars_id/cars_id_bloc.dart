import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/cars_id/cars_id_event.dart';
import 'package:rent_a_car_auto/blocs/cars_id/cars_id_state.dart';
import 'package:rent_a_car_auto/repository/cars_id.dart';

class CarsIdBloc extends Bloc<CarsIdEvent, CarsIdState>{
  final CarsId carsIdRepository;
  CarsIdBloc({required this.carsIdRepository}) : super(CarsIdInitial()) {
    on<CarsIdLoad> ((event, emit) async {
      emit(CarsIdLoading());
      print('1 - Starting to load cars');
      try {
        final idRent = await carsIdRepository.fethIdModel();
        emit(CarsIdLoaded(idRent));
        print('2 - Cats loaded successully: ${idRent.length} cars');
        print('3 - State emitted successfully');
      } catch (e) {
        print('Ошибка $e');
        emit(CarsIdError('Ошибка получения автомобиля $e'));
      }
    });
  }
  
}