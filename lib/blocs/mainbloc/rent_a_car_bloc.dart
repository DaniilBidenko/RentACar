import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_event.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_state.dart';
import 'package:rent_a_car_auto/data/rent_a_car_model.dart';
import 'package:rent_a_car_auto/repository/rent_a_car_repository.dart';

class RentACarBloc extends Bloc<RentACarEvent, RentACarState>{
  final RentACarRepository repository;
  RentACarBloc({required this.repository}) : super(RentACarInitial()) {
    on<RentACarLoad> ((event, emit) async {
      emit(RentACarLoading());
      try{
        final rent = await repository.fethModel();
        emit(RentACarLoaded(rent as List<RentACarModel>));
      } catch (e) {
        emit(RentACarError(e.toString()));
      }
    });
  }
}