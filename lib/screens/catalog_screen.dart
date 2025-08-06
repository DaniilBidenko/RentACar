import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_state.dart';
import 'package:rent_a_car_auto/widgets/cars_card_item.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      body: BlocBuilder<RentACarBloc, RentACarState>(
        builder: (context, state) {
          if (state is RentACarLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RentACarLoaded) {
            return state.rentACar.isEmpty ? _buildEmptyCatalog() : _buildCatalog(state);
          } else if (state is RentACarError) {
            return Center(
              child: Text('На данный момент машин нету'),
            );
          } else {
            return Center(
              child: Text('Все пошло по бороде'),
            );
          }
        }
      )
    );
  }
}

Widget _buildEmptyCatalog () {
  return Center(
    child: Text('Машин пока нет'),
  );
}

Widget _buildCatalog(RentACarLoaded state) {
  final rent = state.rentACar;
  return LayoutBuilder(
            builder: (context, constrains) {
              if (constrains.maxWidth < 600) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                  itemBuilder: (BuildContext context, int index) {
                    return CarsCardItem(rentACar: rent[index]);
                  }
                );
              } else if (constrains.maxWidth < 900) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return CarsCardItem(rentACar: rent[index]);
                  }
                );
              } else if (constrains.maxWidth < 1300) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return CarsCardItem(rentACar: rent[index]);
                  }
                );
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return CarsCardItem(rentACar: rent[index]);
                  }
                );
              }
            }
          );
}