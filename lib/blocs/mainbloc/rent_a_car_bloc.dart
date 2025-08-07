import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_event.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_state.dart';
import 'package:rent_a_car_auto/repository/rent_a_car_repository.dart';

class RentACarBloc extends Bloc<RentACarEvent, RentACarState>{
  final RentACarRepository repository;
  RentACarBloc({required this.repository}) : super(RentACarInitial()) {
    on<RentACarLoad> ((event, emit) async {
      emit(RentACarLoading());
      print('1 - Starting to load cars');
      try{
        final rent = await repository.fethModel();
        emit(RentACarLoaded(rent));
        print('2 - Cats loaded successully: ${rent.length} cars');
        print('3 - State emitted successfully');
      } catch (e) {
        print('Ошибка $e');
        emit(RentACarError(e.toString()));
      }
    });
  }
}