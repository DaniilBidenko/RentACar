import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarsSliderBloc extends Cubit<int>{
  CarsSliderBloc() : super(0);
 final PageController controller = PageController();

  void slider() => emit(state);
}