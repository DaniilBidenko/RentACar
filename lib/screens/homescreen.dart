import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';
import 'package:rent_a_car_auto/widgets/appbar_widget.dart';
import 'package:rent_a_car_auto/widgets/cars_slider.dart';
import 'package:rent_a_car_auto/widgets/footer_slider.dart';
import 'package:rent_a_car_auto/widgets/services_slider.dart';
import 'package:textuality/textuality.dart';


class Homescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
          children: [
            Image.asset('assets/images/cars.png',
              fit: BoxFit.cover,
              width: width,
              height: width < 600 ? height * 0.84 : height * 1.43,
            ),
            AppbarWidget(),
            Padding(
              padding: EdgeInsets.only(top: width < 945 ? width * 0.55 : width * 0.235, left: width < 945 ? width * 0.04 : width * 0.023, bottom: width * 0.2),
              child: Container(
                width: width * 0.9,
                height: height * 0.25,
                // color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: GradientText(
                            text: 'ЭЛИТНЫЙ ПРОКАТ', 
                            giveGradient: [Color.fromRGBO(250, 204, 21, 1), Color.fromRGBO(202, 138, 4, 1)],
                            style: TextStyle(
                              fontSize: width < 945 ? width * 0.09 : width * 0.0635,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Roboto'
                            ),
                            )
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.065, right: width * 0.06),
                      child: Flexible(
                        flex: 2,
                        child: Text('Эксклюзивные суперкары для незабываемых впечатлений. Почувствуйте мощь и роскошь премиальных автомобилей.',
                        style: HomescreenStyle.descriptionCenter(context),
                        )
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.02, right: width * 0.07),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: width < 945 ? 5 : 17, vertical: 12),
                                child: Container(
                                  width: width < 945? width * 0.36 : width * 0.168,
                                  height: width < 945? height * 0.05 : height * 0.075,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(234, 179, 8, 1)
                                    ),
                                    onPressed: () {}, 
                                        child: Text('Выбрать автомобиль',
                                          overflow: TextOverflow.visible,
                                          softWrap: false,
                                          maxLines: 1,
                                            style: TextStyle(
                                              fontSize: width < 945 ? width * 0.025 : width * 0.011,
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Roboto'
                                            ),
                                          ),
                                      )
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width < 945 ? 5 : 17, vertical: 5),
                                  child: Container(
                                    width: width < 945 ? width * 0.3 : width * 0.1,
                                    height: width < 945? height * 0.05 : height * 0.032,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.all(Radius.circular(9999)),
                                      border: Border.all(color: Colors.white, width: 2)
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent
                                      ),
                                      onPressed: () {}, 
                                      child: Center(
                                        child: Text('Узнать больше',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                          style: TextStyle(
                                            fontSize: width < 945 ? width * 0.025 : width * 0.009,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Roboto',
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
          LayoutBuilder(
            builder: (context, constrains) {
              if (constrains.maxWidth < 945) {
                return Container(
            width: width,
            height: width < 945 ? height * 1 : height * 0.05,
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.only(
                top: 50,
                left: 50,
                right: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Text('Премиальная коллекция',
                  style: HomescreenStyle.title(context)
                 ),
                 Padding(padding: EdgeInsets.only(top: 0, left: 0, right: 0),
                  child: Flexible(
                    flex: 2,
                    child: Center(
                      child: Text('Отборные суперкары от ведущих мировых производителей для самых взыскательных клиентов',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                        style: HomescreenStyle.lowDescriprion(context),
                      ),
                    )
                  )
                 ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: CarsSlider()
                  )
                ],
              ),
            )
          );
              } else {
                return Container(
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
                        style: HomescreenStyle.title(context)
                      ),
                      Padding(padding: EdgeInsets.only(top: 30, left: 400, right: 400),
                        child: Flexible(
                          flex: 2,
                          child: Center(
                            child: Text('Отборные суперкары от ведущих мировых производителей для самых взыскательных клиентов',
                            textAlign: TextAlign.center,
                              style: HomescreenStyle.lowDescriprion(context),
                            ),
                          )
                        )
                      ),
                      Padding(padding: EdgeInsets.only(top: 50, right: 65, left: 65),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          card('assets/images/kollection_lamborgini.png', 'Lamborghini Huracan', '15,000₽/день', '610 л.c.', '3.2 сек', '325 км/ч', () {}),
                          card('assets/images/ferrari485.png', 'Ferrari 488 GTB', '18,000₽/день', ' 670 л.c.', '3.0 сек', '330 км/ч', () {}),
                          card('assets/images/porsche911.png', 'Porsche 911 Turbo S', '12,000₽/день', '650 л.c.', '2.7 сек', '330 км/ч', () {})
                        ],
                      ),
                      )
                      ],
                    ),
                  )
                );
              }
            }
            ),
          Container(
            width: width,
            height: width < 945 ? height * 0.63 : height * 1,
            color: Color.fromRGBO(17, 24, 39, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: width < 945 ? 50 : 80, bottom: width < 945 ? 0 : 80),
                child: Text('Премиальный сервис',
                style: HomescreenStyle.title(context),
                )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Исключительно обслуживание на каждом этапе',
                    maxLines: 2,
                      style: HomescreenStyle.topKollectionText(context),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: width < 945 ? 50 : 80),
                child: ServicesSlider()
                )
              ],
            )
          ),
          Container(
            width: width,
            height: width < 945 ? height * 0.45 : height * 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color.fromRGBO(202, 138, 4, 1),
                  Color.fromRGBO(202, 138, 4, 1),
                  Color.fromRGBO(250, 204, 21, 1),
                ]
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 60, bottom: 20),
                  child: Text('Готовы к незабываемому опыту?',
                  style: TextStyle(
                    fontSize: width < 945 ? width * 0.06 : 0.04,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    color: Color.fromRGBO(0, 0, 0, 1)
                  ),
                ),
                ),
                  Padding(padding: EdgeInsets.only(left: 0, right: 0),
                    child: Flexible(
                      flex: 2,
                    child: Center(
                      child: Text('Забронируйте свой идеальный автомобиль прямо сейчас и получите скидку 10% на первую аренду',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: width < 945 ? width * 0.03 : 0.04,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                      ),
                      ),
                    )
                    ),
                  ),
                Padding(padding: EdgeInsets.only(top: 40,bottom: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width < 945 ? width * 0.5 : width * 0.5,
                        height: width < 945 ? height * 0.085 : height * 0.4,
                        color: Colors.transparent,
                        child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black
                        ),
                        onPressed: () {}, 
                        child: Center(
                          child: Text('Забронировать сейчас',
                            style: TextStyle(
                              fontSize: width < 945 ? width * 0.03 : width * 0.05,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(255, 255, 255, 1)
                            ),
                          ),
                        )
                        ),
                      ),
                        SizedBox(width: 15,),
                        Container(
                          width: width < 945 ? width * 0.4 : width * 0.5,
                          height: width < 945 ? height * 0.085 : height * 0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(9999)),
                            color: Colors.transparent,
                          ),
                          
                          child:  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            
                          ),
                          onPressed: () {}, 
                          child: Center(
                            child: Text('Связаться с нами',
                              style: TextStyle(
                                fontSize: width < 945 ? width * 0.03 : width * 0.05,
                                fontWeight: FontWeight.w700,
                                color: Colors.black
                              ),
                            ),
                          )
                        ),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: width,
            height: width < 945 ? height * 0.45 : height * 0.2,
            color: Color.fromRGBO(0, 0, 0, 1),
            child: Column(  
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 50, right: 50),
                  child: FooterSlider()
                ),
                Container(
                  width: 1280,
                  height: 57,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      top:BorderSide(
                        width: 1,
                        color: Color.fromRGBO(31, 41, 55, 1)
                      )
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(),
                    child: Center(
                      child: Text('© 2024 EliteRent. Все права защищены.',
                        style: HomescreenStyle.lowDescriprion(context),
                      ),
                    )
                  ),
                ),
              ],
            )
          ),
        ],
      )
    ),
    );
     
  }
}

Widget lowContainer (String title, String descriprion, String firstDescriprion, String secondDescription, String trheeDescription, BuildContext context) {
  return Container(
    width: 296,
    height: 164,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(padding: EdgeInsets.only(bottom: 18),
            child: Text(title,
              style: HomescreenStyle.lowTitle,
            ),
        ),
        Text(descriprion,
          style: HomescreenStyle.lowDescriprion(context)
        ),
        Text(firstDescriprion,
          style: HomescreenStyle.lowDescriprion(context)),
        Text(secondDescription,
          style: HomescreenStyle.lowDescriprion(context)),
        Text(trheeDescription,
          style: HomescreenStyle.lowDescriprion(context))
      ],
    ),
  );
}

Widget messangers (String img) {
  return Container(
    width: 32,
    height: 32,
    decoration: BoxDecoration(
      color: Color.fromRGBO(55, 65, 81, 1),
      borderRadius: BorderRadius.all(Radius.circular(99))
    ),
    child: Center(
      child: Image.asset(img,
      fit: BoxFit.cover,
      width: 16,
      height: 16,
      ),
    ),
  );
}


