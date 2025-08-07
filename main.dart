import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_event.dart';
import 'package:rent_a_car_auto/repository/rent_a_car_repository.dart';
import 'package:rent_a_car_auto/screens/bronirovanie_screen.dart';
import 'package:rent_a_car_auto/screens/catalog_screen.dart';
import 'package:rent_a_car_auto/screens/homescreen.dart';
import 'package:rent_a_car_auto/blocs/sliders/cars_slider_bloc.dart';
import 'package:rent_a_car_auto/blocs/sliders/services_slider_bloc.dart';
import 'package:rent_a_car_auto/screens/katalog_screen.dart';


void main () {
  runApp(RentACar());
}

class RentACar extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => RentACarRepository(),
        child: MultiBlocProvider(
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
          BlocProvider(
            create: (BuildContext context) {
              final repository = RepositoryProvider.of<RentACarRepository>(context);
              final mainBloc = RentACarBloc(repository: repository);
              mainBloc.add(RentACarLoad());
              return mainBloc;
            }
          )
        ], 
        child: Homescreen()
      ),
      )
    );
  }
} 