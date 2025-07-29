
import 'package:flutter_bloc/flutter_bloc.dart';

class CarsSliderBloc extends Cubit<int>{
  CarsSliderBloc() : super(0);

  void carsslider() => emit(state);
}