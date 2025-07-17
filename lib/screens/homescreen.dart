import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/styles/gradient_text.dart';
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
              padding: EdgeInsets.only(top: 350, left: 35),
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
                                        style: HomescreenStyle.appbarButtonTextStyle,
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
          Stack(
            children: [
              Container(
                    color: Colors.black,
                    width: 1550,
                    height: 832,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 80,
                        right: 32,
                        bottom: 80,
                        left: 32
                      ),
                      child: Container(
                        width: 1376,
                        height: 672,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 48,
                            left: 48
                          ),
                          child: Center(
                            child: Container(
                              width: 1280,
                              height: 672,
                              child: Column(
                                children: [
                                  Container(
                                    width: 1280,
                                    height: 192,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 64),
                                      child: Column(
                                        
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
            ],
          )
        ],
      )
    );
  }
}