import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/sliders/cars_slider_bloc.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';

class CarsSlider extends StatelessWidget{
  
  final PageController _pageController = PageController();
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsSliderBloc, int>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
            height: 500,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                context.read<CarsSliderBloc>().carsslider();
              },
              children: [
                card('assets/images/kollection_lamborgini.png', 'Lamborghini Huracan', '15,000₽/день', '610 л.c.', '3.2 сек', '325 км/ч', () {}),
                card('assets/images/ferrari485.png', 'Ferrari 488 GTB', '18,000₽/день', ' 670 л.c.', '3.0 сек', '330 км/ч', () {}),
                card('assets/images/porsche911.png', 'Porsche 911 Turbo S', '12,000₽/день', '650 л.c.', '2.7 сек', '330 км/ч', () {})
              ],
            ),
            ),
          ],
        );
      }
      );
  }
}

Widget card (String img, String label, String price, String hoursePower, String sekund, String kmHour, VoidCallback function) {
    return Container(
      width: 420,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(img,
              fit: BoxFit.cover,
              width: 405.33,
              height: 270,
              ),
            ],
          ),
          Container(
            width: 405.33,
            height: 230,
            color: Color.fromRGBO(31, 41, 55, 1),
            child: Padding(padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(label,
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
                      Text(price,
                        style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.w700,
                           color: Color.fromRGBO(250, 204, 21, 1)
                        ),
                      )
                    ],
                  ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 0, right: 0),
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
                                  child: Text(hoursePower, style: HomescreenStyle.characteristickContainerText),
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
                                  child: Text(sekund, style: HomescreenStyle.characteristickContainerText),
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
                                  child: Text(kmHour, style: HomescreenStyle.characteristickContainerText),
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
                    onPressed: function,
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