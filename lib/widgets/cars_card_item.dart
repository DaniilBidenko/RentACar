import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_state.dart';
import 'package:rent_a_car_auto/data/rent_a_car_model.dart';
import 'package:rent_a_car_auto/screens/bronirovanie_screen.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';

class CarsCardItem extends StatefulWidget{
  final RentACarModel rentACar;
  const CarsCardItem({required this.rentACar, Key? key}) : super(key: key);
  @override
  State<CarsCardItem> createState() => _CarsCardItemState();
}

class _CarsCardItemState extends State<CarsCardItem> {
  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<RentACarBloc, RentACarState>(
      builder: (context, state) {
        return Container(
          width: width < 600 ? width : 420 ,
          height: width < 600 ? height * 0.5 : 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(widget.rentACar.photos.toString(),
                  fit: BoxFit.cover,
                  width: width < 600 ? width : 405.33,
                  height: 270,
                  ),
                ],
              ),
              Container(
                width: width < 600 ? width : 405.33,
                height: 230,
                color: Color.fromRGBO(31, 41, 55, 1),
                child: Padding(padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.rentACar.model,
                            style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(255, 255, 255, 1)
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        children: [
                          Text(widget.rentACar.pricePerDay,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(250, 204, 21, 1)
                            ),
                          )
                        ],
                      ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 0, right: width < 945 ? width * 0.1 : 90),
                        child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                    width: 73.84,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(9999)),
                                      color: Color.fromRGBO(55, 65, 81, 1)
                                    ),
                                    child: Center(
                                      child: Text(widget.rentACar.horsepower.toString(), style: HomescreenStyle.characteristickContainerText),
                                    ),
                                  ),
                                Container(
                                    width: 70,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(9999)),
                                      color: Color.fromRGBO(55, 65, 81, 1)
                                    ),
                                    child: Center(
                                      child: Text(widget.rentACar.year.toString(), style: HomescreenStyle.characteristickContainerText),
                                    ),
                                  ),
                                Container(
                                    width: 83,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(9999)),
                                      color: Color.fromRGBO(55, 65, 81, 1)
                                    ),
                                    child: Center(
                                      child: Text(widget.rentACar.brand, style: HomescreenStyle.characteristickContainerText),
                                    ),
                                  ),
                            ],
                          ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Container(
                        width: 357.34,
                        height: 48,
                        child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(234, 179, 8, 1)
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BronirovanieScreen()));
                        },
                          child: Center(
                            child: Text('Забронировать',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(0, 0, 0, 1)
                              ),
                            ),
                          )
                        ),
                      )
                      )
                    ],
                  ),
                ),
              ),
            ]
          )
        );
      }
    );
  }
}