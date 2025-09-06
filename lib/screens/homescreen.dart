import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/screens/bronirovanie_screen.dart';
import 'package:rent_a_car_auto/screens/catalog_screen.dart';
import 'package:rent_a_car_auto/screens/katalog_screen.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';
import 'package:rent_a_car_auto/widgets/appbar_widget.dart';
import 'package:rent_a_car_auto/widgets/cars_slider.dart';
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
              height: width < 600 ? height * 1 : height * 1.45,
            ),
            AppbarWidget(),
            Padding(
              padding: EdgeInsets.only(top: width < 945 ? width * 0.55 : width * 0.231, left: width < 945 ? width * 0.04 : width * 0.042, bottom: width * 0.2),
              child: Container(
                width: width < 945 ? width * 0.9 : width * 0.6,
                height: width < 945 ? height * 0.4 : height * 0.5,
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
                              fontSize: width < 945 ? width * 0.09 : width * 0.0615,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Roboto'
                            ),
                            )
                        )
                      ],
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(left: width < 945 ? width * 0.065 : width * 0.02, right: width * 0.06),
                        child: Text('Эксклюзивные суперкары для незабываемых впечатлений. Почувствуйте мощь и роскошь премиальных автомобилей.',
                        textAlign: TextAlign.center,
                        style: HomescreenStyle.descriptionCenter(context),
                        )
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: width < 945 ? width * 0.02 : width * 0.0235, right: width * 0.07),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: width < 945 ? 5 : 17, vertical: 12),
                                child: Container(
                                  width: width < 945? width * 0.35 : width * 0.155,
                                  height: width < 945? height * 0.065 : height * 0.075,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(234, 179, 8, 1)
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogScreen()));
                                    }, 
                                        child: Text('Выбрать автомобиль',
                                          softWrap: false,
                                          maxLines: 1,
                                            style: TextStyle(
                                              fontSize: width < 945 ? width * 0.025 : width * 0.01,
                                              fontWeight: FontWeight.w900,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Roboto'
                                            ),
                                          ),
                                      )
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width < 945 ? 5 : 0, vertical: 5),
                                  child: Container(
                                    width: width < 945 ? width * 0.30 : width * 0.12,
                                    height: width < 945? height * 0.065 : height * 0.075,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color.fromRGBO(234, 179, 8, 1),
                                      ),
                                      onPressed: () {}, 
                                      child: Center(
                                        child: Text('Узнать больше',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                          style: TextStyle(
                                            fontSize: width < 945 ? width * 0.025 : width * 0.009,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Roboto',
                                            color: Colors.black
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
              if (constrains.maxWidth < 600) {
                return Container(
                  width: width,
                  height: height * 1,
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 50,
                      left: 0,
                      right: 0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Text('Премиальная коллекция',
                        style: HomescreenStyle.title(context)
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(top: 0, left: 0, right: 0),
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
              } else if (constrains.maxWidth < 945) {
                return Container(
                  width: width,
                  height:height * 2.6,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 80,
                      left: 50,
                      right: 50,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Премиальная коллекция',
                          style: HomescreenStyle.title(context)
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(top: 30, left: 110, right: 110),
                            child: Center(
                              child: Text('Отборные суперкары от ведущих мировых производителей для самых взыскательных клиентов',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                                style: HomescreenStyle.lowDescriprion(context),
                              ),
                            )
                          )
                        ),
                        card('assets/images/ferrari485.png', 'Ferrari 488 GTB', '18,000 ₽/день', ' 670 л.c.', '3.0 сек', '330 км/ч', () {}, context),
                        card('assets/images/kollection_lamborgini.png', 'Lamborghini Huracan', '15,000 ₽/день', '610 л.c.', '3.2 сек', '325 км/ч', () {}, context),
                        card('assets/images/porsche911.png', 'Porsche 911 Turbo S', '12,000 ₽/день', '650 л.c.', '2.7 сек', '330 км/ч', () {}, context)
                      ]
                    )
                  )
                );
              } else {
                return Container(
                  width: width,
                  height: width < 1500 ? height * 2 : height * 1.3 ,
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 0,
                      left: 50,
                      right: 50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Text('Премиальная коллекция',
                        style: HomescreenStyle.title(context)
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(top: 0, left: 110, right: 110),
                          child: Center(
                            child: Text('Отборные суперкары от ведущих мировых производителей для самых взыскательных клиентов',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                              style: HomescreenStyle.lowDescriprion(context),
                            ),
                          )
                        )
                      ),
                      LayoutBuilder(
                        builder: (context, constrains) {
                           if (constrains.maxWidth < 1400) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                card('assets/images/ferrari485.png', 'Ferrari 488 GTB', '18,000 ₽/день', ' 670 л.c.', '3.0 сек', '330 км/ч', () {}, context),
                                Padding(padding: EdgeInsets.only(top: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    card('assets/images/kollection_lamborgini.png', 'Lamborghini Huracan', '15,000 ₽/день', '610 л.c.', '3.2 сек', '325 км/ч', () {}, context),
                                    card('assets/images/porsche911.png', 'Porsche 911 Turbo S', '12,000 ₽/день', '650 л.c.', '2.7 сек', '330 км/ч', () {}, context)
                                  ],
                                )
                                )
                              ],
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.only(top: 0, right: width * 0.025),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    card('assets/images/ferrari485.png', 'Ferrari 488 GTB', '18,000 ₽/день', ' 670 л.c.', '3.0 сек', '330 км/ч', () {}, context),
                                    card('assets/images/kollection_lamborgini.png', 'Lamborghini Huracan', '15,000 ₽/день', '610 л.c.', '3.2 сек', '325 км/ч', () {}, context),
                                    card('assets/images/porsche911.png', 'Porsche 911 Turbo S', '12,000 ₽/день', '650 л.c.', '2.7 сек', '330 км/ч', () {}, context)
                                  ],
                              ),
                            );
                          }
                        }
                        )
                      ],
                    ),
                  )
                );
              }
            }
            ),
          LayoutBuilder(
            builder: (context, constrains) {
              if (constrains.maxWidth < 945) {
                return Container(
                  width: width,
                  height: width < 945 ? height * 0.6 : height * 1,
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
                );
              } else if (constrains.maxWidth < 1200) {
                return Container(
                  width: width,
                  height: width < 945 ? height * 0.5 : height * 1,
                  color: Color.fromRGBO(17, 24, 39, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: width < 1200 ? 0 : 80, bottom: width < 1200 ? 0 : 80),
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
                      Padding(padding: EdgeInsets.only(top: width < 1200 ? 50 : 80),
                      child: ServicesSlider()
                      )
                    ],
                  )
                );
              }
                else {
                return Container(
                  width: width,
                  height: width < 945 ? height * 0.7 : height * 1,
                  color: Color.fromRGBO(17, 24, 39, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: width < 945 ? 50 : 80, bottom: width < 945 ? 0 : 20),
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
                      Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: ServicesSlider()
                        )
                    ]
                  )
                );
              }
            } 
            ),
          Container(
            width: width,
            height: width < 945 ? height * 0.55 : height * 0.7,
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
                    fontSize: width < 945 ? width * 0.05 : width * 0.05,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    color: Color.fromRGBO(0, 0, 0, 1)
                  ),
                ),
                ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(left: width < 945 ? width * 0.05 : width * 0.05, right: width < 945 ? width * 0.05 : width * 0.05),
                      child: Center(
                        child: Text('Забронируйте свой идеальный автомобиль прямо сейчас и получите скидку 10% на первую аренду',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: width < 945 ? width * 0.025 : width * 0.02,
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
                        width: width < 945 ? width * 0.43 : width * 0.275,
                        height: width < 945 ? height * 0.075 : height * 0.125,
                        color: Colors.transparent,
                        child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BronirovanieScreen()));
                        }, 
                        child: Center(
                          child: Text('Забронировать сейчас',
                            style: TextStyle(
                              fontSize: width < 945 ? width * 0.03 : width * 0.02,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(255, 255, 255, 1)
                            ),
                          ),
                        )
                        ),
                      ),
                        SizedBox(width: 30,),
                        Container(
                          width: width < 945 ? width * 0.4 : width * 0.22,
                          height: width < 945 ? height * 0.085 : height * 0.125,
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
                                fontSize: width < 945 ? width * 0.03 : width * 0.02,
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
          LayoutBuilder(
            builder: (context, constrains) {
              if(constrains.maxWidth < 945) {
                return Container(
                          width: width,
                          height: width < 945 ? height * 0.7 : height * 0.2,
                          color: Color.fromRGBO(0, 0, 0, 1),
                          child: Column(  
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: width * 0.45,
                                    height: width < 945 ? height * 0.3 : height,
                                    child: Padding(padding: EdgeInsets.only(left: width * 0.03),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('EliteRent',
                                            style: TextStyle(
                                            color: Color.fromRGBO(250, 204, 21, 1),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400
                                            ),
                                          ),
                                          Flexible(
                                            child: Text('Премиальный прокат экслюзивных автомобилей в Москве',
                                            style: HomescreenStyle.lowDescriprion(context),
                                            )
                                          ),
                                          Padding(padding: EdgeInsets.only(left: 0, right: width * 0.2),
                                          child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            messangers('assets/images/Icon-203.png'),
                                            messangers('assets/images/Icon-206.png'),
                                            messangers('assets/images/I-208.png'),
                                          ],
                                          ),
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                                lowContainer('Автомобили', 'Люкс класс', 'Спорткар', 'Экзотическое', 'Классические', context),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  lowContainer('Услуги', 'Доставка', 'С водителем', 'Мероприятия', 'Долгосрочная аренда', context),
                                  lowContainer('Контакты', '+7 (495) 123-45-67', 'info@elitrent.ru', 'Москва, ул. Тверская, 15', 'Работаем 24/7', context)
                                ],
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
              );
              } else {
                return Container(
                  width: width,
                  height: height * 0.6,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  child: Column(  
                    children: [
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                                  Container(
                                    width: width * 0.25,
                                    height: height * 0.3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('EliteRent',
                                          style: TextStyle(
                                            color: Color.fromRGBO(250, 204, 21, 1),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        Flexible(
                                          child: Text('Премиальный прокат экслюзивных автомобилей в Москве',
                                          style: HomescreenStyle.lowDescriprion(context),
                                          )
                                        ),
                                      Padding(padding: EdgeInsets.only(left: 0, right: width * 0.11),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                        messangers('assets/images/Icon-203.png'),
                                        messangers('assets/images/Icon-206.png'),
                                        messangers('assets/images/I-208.png'),
                                        ],
                                      ),
                                      )
                                      ],
                                    ),
                                  ),
                                        lowContainer('Автомобили', 'Люкс класс', 'Спорткар', 'Экзотическое', 'Классические', context),
                                        lowContainer('Услуги', 'Доставка', 'С водителем', 'Мероприятия', 'Долгосрочная аренда', context),
                                        lowContainer('Контакты', '+7 (495) 123-45-67', 'info@elitrent.ru', 'Москва, ул. Тверская, 15', 'Работаем 24/7', context)
                                ],
                              ),
                            ),
                           
                          ],
                        )
                      );
              }

            }
          )
        ],
      )
    ),
    );
     
  }
}

Widget lowContainer (String title, String descriprion, String firstDescriprion, String secondDescription, String trheeDescription, BuildContext context) {
  double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
  return Container(
    width: width < 945 ? width * 0.45 : 150,
    height: width < 945 ? height * 0.3 : height * 0.5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

Widget services (String  icon, String label, String lowerText) {
  return Container(
    width: 300,
    height: 200,
    child: Center(
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(99)),
              color: Color.fromRGBO(234, 179, 8, 1)
            ),
            child: Center(
              child: Image.asset(icon,
              width: 31.25,
              height: 30,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 24, bottom: 15),
            child: Text(label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(255, 255, 255, 1)
            ),
          ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Text(lowerText,
              textAlign: TextAlign.center,
               style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(156, 163, 175, 1)
            ),
              ),
            )
            )
        ],
      ),
    ),
  );
}


