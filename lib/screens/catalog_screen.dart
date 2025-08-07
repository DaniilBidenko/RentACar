import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_state.dart';
import 'package:rent_a_car_auto/widgets/appbar_widget.dart';
import 'package:rent_a_car_auto/widgets/cars_card_item.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
   
    return Scaffold(
      body: BlocBuilder<RentACarBloc, RentACarState>(
        builder: (context, state) {
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          double buttonWidth =  width < 945 ? width * 0.15 : width * 0.1;
          double buttonHeight = width < 945 ? height * 0.07 : height * 0.055;
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
          itemCount: rent.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (BuildContext context, int index) {
            return CarsCardItem(rentACar: rent[index]);
          }
        );
      } else if (constrains.maxWidth < 900) {
        return GridView.builder(
          itemCount: rent.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return CarsCardItem(rentACar: rent[index]);
          }
        );
      } else if (constrains.maxWidth < 1300) {
        return GridView.builder(
           itemCount: rent.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return CarsCardItem(rentACar: rent[index]);
          }
        );
      } else {
        return GridView.builder(
           itemCount: rent.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            return CarsCardItem(
              rentACar: rent[index],
              key: ValueKey('rent_${rent[index].id}_${DateTime.now().millisecondsSinceEpoch}'),
              );
          }
        );
      }
    }
  );
}

Widget classAuto (Color buttonColor, VoidCallback navigation, String label, Color textColor, BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
    return Container(
      width: width < 945 ? width * 0.18 : width * 0.14,
      height: width < 945 ?  height * 0.035 : height * 0.06,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(9999))
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor
        ),
        onPressed: navigation, 
        child: Center(
          child: Text(label,
          style: TextStyle(
            fontSize: width * 0.012,
            fontWeight: FontWeight.w600,
            color: textColor
          ),
          ),
        )
      ),
    );
}
