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
      print('1 - Starting to load bron');
      try {
        final bron = await repository.fethBron();
        emit(BronirovanieLoaded(bron));
        print('2 - Bron loaded successully: ${bron.length} bron');
        print('3 - State emitted successfully');
      } catch (e) {
        print('Ошибка $e');
        emit(BronirovanieError(e.toString()));
      }
    });
  }

}