import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rent_a_car_auto/screens/bronirovanie_screen.dart';

class Cards extends StatelessWidget {
  Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248,
      height: 40,
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(234, 179, 8, 1)
      ),
      onPressed: () {
        _showCard(context);
      },
        child: Center(
          child: Text('Подробнее',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 0, 0, 1)
            ),
          ),
        )
      )
    );
  }

  Future<void> _showCard(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return showDialog<void>(
      barrierColor: Colors.transparent,
      context: context, 
      builder: (BuildContext context) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ModalBarrier(
              color: Colors.black87,
            ),
            Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Container(
                    width: width * 0.5,
                    height: height * 0.85,
                    color: Color.fromRGBO(17, 24, 39, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/images/porsche911.png',
                            fit: BoxFit.cover,
                            width: width * 0.3,
                            height: height * 0.4,
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                width: width * 0.5,
                                height: height * 0.15,
                                color: Color.fromRGBO(17, 24, 39, 1),
                              ),
                              
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }, 
                                icon: Icon(Icons.close)
                              )
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(width * 0.015),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width * 0.25,
                              height: height * 0.38,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Porsche 911 Turbo S',
                                    style: TextStyle(
                                      fontSize: width * 0.02,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(255, 255, 255, 1)
                                    ),
                                  ),
                                  Text('Немецкий спорткар с непревзойденной точностью и мощностью',
                                    style: TextStyle(
                                      fontSize: width * 0.009,
                                      color: Color.fromRGBO(156, 163, 175, 1)
                                    )
                                  ),
                                  Padding(padding: EdgeInsets.only(right: width * 0.015),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        characteristickCards('650 л.c.', context),
                                        characteristickCards('2.7 сек', context),
                                        characteristickCards('350 км/ч', context)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.125,
                                    width: width * 0.4,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        puncts(context, 'assets/images/yelowaccept.png', 'Полное страхование включено'),
                                        puncts(context, 'assets/images/car.png', 'Бесплатная доставка по Москве'),
                                        puncts(context, 'assets/images/time.png', 'Минимальная аренда: 4 часа'),
                                        puncts(context, 'assets/images/person.png', 'Персональный менеджер'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: width * 0.2,
                              height: height * 0.38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                color: Color.fromRGBO(31, 41, 55, 1),
                              ),
                              child: Padding(padding: EdgeInsets.all(width * 0.01),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('12,000 ₽',
                                    style: TextStyle(
                                      fontSize: width * 0.015,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(250, 204, 21, 1)
                                    ),
                                  ),
                                  Text('за день аренды',
                                    style: TextStyle(
                                      fontSize: width * 0.009,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(156, 163, 175, 1)
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.3,
                                    height: height * 0.05,
                                    child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(234, 179, 8, 1)
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => BronirovanieScreen()));
                                    }, 
                                    child: Text('Забронировать',
                                      style: TextStyle(
                                        fontSize: width * 0.009,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black
                                      ),
                                    )
                                  ),
                                  ),
                                  Container(
                                    width: width * 0.3,
                                    height:  height * 0.05,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color.fromRGBO(31, 41, 55, 1),
                                        side: BorderSide(
                                          color: Color.fromRGBO(234, 179, 8, 1),
                                          width: 2
                                        )
                                      ),
                                      onPressed: () {}, 
                                      child: Text('Получить консультацию',
                                        style: TextStyle(
                                          fontSize: width * 0.009,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(234, 179, 8, 1)
                                        ),
                                      )
                                    ),
                                  ),
                                  Text('Нужна помощь с выбором?',
                                    style: TextStyle(
                                      fontSize: width * 0.009,
                                      color: Color.fromRGBO(156, 163, 175, 1),
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Text('+7 (495) 123-45-67',
                                    style: TextStyle(
                                      fontSize: width * 0.009,
                                      color: Color.fromRGBO(250, 204, 21, 1),
                                      fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                              )
                            )
                          ],
                        ),
                        )
                      ],
                    ),
                  )
                  )
                ],
              ),
            )
          ],
        );
      }
    );
  }
}

Widget characteristickCards (String label,BuildContext context) {
  double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
  return Container(
    width: width * 0.07,
    height: height * 0.06,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      color: Color.fromRGBO(31, 41, 55, 1)
    ),
    child: Center(
      child: Text(label,
        style: TextStyle(
          fontSize: width * 0.01,
          fontWeight: FontWeight.w600,
          color: Colors.white
        ),
      ),
    ),
  );  
}

Widget puncts (BuildContext context, String img, String label) {
  return Row(
    children: [
      Padding(padding: EdgeInsets.only(right: 15),
      child: Image.asset(img,
      fit: BoxFit.cover,
      width: 15,
      height: 15,
      ),
      ),
      Text(label,
        style: TextStyle(
          color: Color.fromRGBO(156, 163, 175, 1)
        ),
      )
    ],
  );
}