import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/screens/bronirovanie_screen.dart';
import 'package:rent_a_car_auto/screens/homescreen.dart';
import 'package:rent_a_car_auto/blocs/sliders/cars_slider_bloc.dart';
import 'package:rent_a_car_auto/blocs/sliders/services_slider_bloc.dart';


void main () {
  runApp(RentACar());
}

class RentACar extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final bloc = CarsSliderBloc();
              return bloc;
            }
          ),
          BlocProvider(
            create: (BuildContext context) {
              final servisbloc = ServicesSliderBloc();
              return servisbloc;
            }
          ),
        ], 
        child: BronirovanieScreen()
      )
    );
  }
} 