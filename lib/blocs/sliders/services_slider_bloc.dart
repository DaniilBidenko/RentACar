import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesSliderBloc extends Cubit<int>{
  ServicesSliderBloc() : super(0);

  PageController servisController = PageController();
  
  void servicesslider () => emit(state);
}