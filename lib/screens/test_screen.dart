import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/bronirovanie/bronirovanie_bloc.dart';
import 'package:rent_a_car_auto/blocs/bronirovanie/bronirovanie_state.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_event.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_state.dart';
import 'package:rent_a_car_auto/data/bronirovanie.dart';
import 'package:rent_a_car_auto/data/rent_a_car_model.dart';

class TestScreen extends StatefulWidget{
  TestScreen({Key? key}) : super(key: key);
  @override
  State<TestScreen> createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<RentACarBloc, RentACarState>(
          builder: (context, state) {
            if (state is RentACarLoading) {
              return Center(
                child: CircularProgressIndicator()
              );
            } else if (state is RentACarLoaded) {
              return Center(
                child: PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return state.rentACar.map((item) {
                      return PopupMenuItem(
                        value: item,
                        child: Row(
                          children: [
                            Text(item.model),
                            Text(item.brand),
                            Text(item.pricePerDay)
                          ],
                        )
                      );
                    }).toList();
                  }
                )
              );
            } else if (state is BronirovanieError) {
              return Center(
                child: Text('Ошибка'),
              );
            } else {
              return Center(child: Text('Иди нахуй'),);
            }
          }
        )
      ),
    );
  }
}