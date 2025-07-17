import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';
import 'package:rent_a_car_auto/widgets/appbar_widget.dart';


class Homescreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
          children: [
            Image.asset('lib/assets/images/cars.png',
              fit: BoxFit.cover,
              width: 1550,
              height: 1024,
            ),
            AppbarWidget(),
            Padding(
              padding: EdgeInsets.only(top: 350, left: 38),
              child: Container(
                width: 905.33,
                height: 315,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text('ЭЛИТНЫЙ ПРОКАТ',
                            style: TextStyle(
                              fontSize: 95,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Roboto',
                              color: Colors.amber
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 73.66, bottom: 0, left: 52.66),
                          child: Column(
                            children: [
                              Text('Экслюзивные суперкары для незабываемых впечатлений.',
                              style: HomescreenStyle.descriptionCenter,
                              ),
                              Text('Почувствуйте мощь и роскошь премиальных автомобилей.',
                              style: HomescreenStyle.descriptionCenter,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 16, right: 32, bottom: 16, left: 32),
                                child: Container(
                                  width: 247.08,
                                  height: 64,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(234, 179, 8, 1)
                                    ),
                                    onPressed: () {}, 
                                    child: Center(
                                      child: Text('Выбрать автомобиль',
                                        style: HomescreenStyle.yelowButtonsText,
                                      ),
                                    )
                                  ),
                                ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top: 18, right: 34, bottom: 18, left: 34),
                                  child: Container(
                                    width: 196.84,
                                    height: 64,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent
                                      ),
                                      onPressed: () {}, 
                                      child: Center(
                                        child: Text('Узнать больше',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromRGBO(255, 255, 255, 1)
                                          )
                                        ),
                                      )
                                    ),
                                  ),
                                )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              )
            ]
          ),
          Container(
            width: 1550,
            height: 900,
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.only(
                top: 80,
                left: 50,
                right: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Text('Премиальная коллекция',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(255, 255, 255, 1)
                  ),
                 ),
                 Padding(padding: EdgeInsets.only(top: 30, left: 304, right: 304),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Отборные суперкары от ведущих производителей для самых',
                          style: HomescreenStyle.topKollectionText,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('взыскательных клиентов',
                          style: HomescreenStyle.topKollectionText,
                          )
                        ],
                      )
                    ],
                  ),
                 ),
                 Padding(padding: EdgeInsets.only(top: 50, right: 65, left: 65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    card('lib/assets/images/kollection_lamborgini.png', 'Lamborghini Huracan', '15,000/день', '610 л.c.', '3.2 сек', '325 км/ч', () {}),
                    card('lib/assets/images/ferrari485.png', 'Ferrari 488 GTB', '18,000/день', ' 670 л.c.', '3.0 сек', '330 км/ч', () {}),
                    card('lib/assets/images/porsche911.png', 'Porsche 911 Turbo S', '12,000/день', '650 л.c.', '2.7 сек', '330 км/ч', () {})
                  ],
                 ),
                 )
                ],
              ),
            )
          )
              
        ],
      )
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
                  Padding(padding: EdgeInsets.only(left: 0, right: 110),
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

// Container(
//         width: 405.33,
//         height: 480,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(16)),
//             color: Color.fromRGBO(31, 41, 55, 1)
//           ),
//           child: ,
//         )