import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/bronirovanie/bronirovanie_event.dart';
import 'package:rent_a_car_auto/blocs/bronirovanie/bronirovanie_state.dart';
import 'package:rent_a_car_auto/data/bronirovanie.dart';
import 'package:rent_a_car_auto/repository/bronirovanie_repository.dart';

class BronirovanieBloc extends Bloc<BronirovanieEvent, BronirovanieState>{
  final BronirovanieRepository repository;
  BronirovanieBloc({required this.repository}) : super(BronirovanieInitial()) {
    on<BronirovanieCustAdd> ((event, emit) async {
      emit(BronirovanieLoading());
      print('1 - Starting to create booking');
      try {
        // Отправляем данные клиента на сервер
        final success = await repository.createBooking(event.broncust);
        print(success);
        if (success) {
          // Если успешно, загружаем обновленный список бронирований
          final bron = await repository.fethBron();
          emit(BronirovanieLoaded(bron));
          print(bron);
          print('2 - Booking created and list updated: ${bron.length} bookings');
        } else {
          emit(BronirovanieError('Не удалось создать бронирование'));
        }
      } catch (e) {
        print('Ошибка при создании бронирования: $e');
        emit(BronirovanieError('Ошибка при создании бронирования: ${e.toString()}'));
      }
    });
  }

}