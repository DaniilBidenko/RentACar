import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/bronirovanie/bronirovanie_state.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_state.dart';

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
              String dropDownValue = '${state.rentACar.first.brand} ${state.rentACar.first.model}';
              return Center(
                child: DropdownButton<String>(
                  value: null,
                  hint: const Text("Выбери автомобиль"),
                  items: state.rentACar.map<DropdownMenuItem<String>>((item) {
                    return DropdownMenuItem<String>(
                      value: item.id, // id будет выбранным значением
                      child: Text("${item.brand} ${item.model}"),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dropDownValue = value!;
                    });
                    // выводим id в консоль
                    print("Выбран автомобиль с id: $value");
                  },
                ),
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