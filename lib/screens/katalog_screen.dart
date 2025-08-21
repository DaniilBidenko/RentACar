import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_bloc.dart';
import 'package:rent_a_car_auto/blocs/mainbloc/rent_a_car_state.dart';
import 'package:rent_a_car_auto/screens/homescreen.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';
import 'package:rent_a_car_auto/widgets/appbar_widget.dart';
import 'package:rent_a_car_auto/widgets/cars_card.dart';

class KatalogScreen extends StatelessWidget{
@override
Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  double buttonWidth =  width < 945 ? width * 0.15 : width * 0.1;
  double buttonHeight = width < 945 ? height * 0.07 : height * 0.055;
  return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppbarWidget(),
    body: ListView(
      children: [
        Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: width * 0.05),
                child: Text('Каталог автомобилей',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width < 945 ? width * 0.07 : width * 0.045,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: width * 0.03, left: width < 945 ? 0 : width * 0.1, right: width < 945 ? 0 : width * 0.1),
                  child: Text('Выберите идеальный автомобиль из нашей эксклюзивной коллекции премиальных суперкаров',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Color.fromRGBO(156, 163, 175, 1),
                    fontSize: width < 945 ? width * 0.025 : width * 0.02
                  ),
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: width * 0.03, left: width < 945 ? width * 0 : width * 0.13, right: width < 945 ? width * 0 : width * 0.13, bottom: height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width < 945 ? width * 0.195 : width * 0.15,
                      height: width < 945 ?  height * 0.035 : height * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(9999))
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(234, 179, 8, 1)
                        ),
                        onPressed: () {}, 
                        child: Center(
                          child: Text('Все автомобили',
                          style: TextStyle(
                            fontSize: width * 0.012,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                          ),
                          ),
                        )
                      ),
                    ),
                    classAuto(Color.fromRGBO(43, 44, 45, 1), () {}, 'Люкс класс', Colors.white, context),
                    classAuto(Color.fromRGBO(31, 41, 55, 1), () {}, 'Спорткары', Colors.white, context),
                    classAuto(Color.fromRGBO(31, 41, 55, 1), () {}, 'Экзотические', Colors.white, context),
                    classAuto(Color.fromRGBO(31, 41, 55, 1), () {}, 'Классические', Colors.white, context),
                  ],
                ),
              ),
              LayoutBuilder(
                builder: (context, constrains) {
                  if (constrains.maxWidth < 600) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                        children: [
                          katalogcard(context, 'assets/images/kollection_lamborgini.png', 'Lamborghini Huracán', 'Итальянский суперкар с невероятной динамикой и завораживающим дизайном', 15, 610, 325, 3.2, () {}),
                          katalogcard(context, 'assets/images/ferrari485.png', 'Ferrari 488 GTB', 'Легендарный Ferrari с турбированным V8 и исключительными характеристиками', 15, 610, 325, 3.2, () {}),
                          katalogcard(context, 'assets/images/porsche911.png', 'Porsche 911 Turbo S', 'Британский суперкар с революционной аэродинамикой', 15, 610, 325, 3.2, () {}),
                          katalogcard(context, 'assets/images/maclaren720s.png', 'McLaren 720S', 'Британский суперкар с революционной аэродинамикой', 20, 720, 341, 2.9, () {}),
                          katalogcard(context, 'assets/images/bentley.png', 'Bentley Continental GT', 'Британская роскошь и комфорт в спортивном исполнении', 8, 635, 333, 3.7, () {}),
                          katalogcard(context, 'assets/images/astonmartindb11.png', 'Aston Martin DB11', 'Классическая британская элегантность с современными технологиями', 10, 630, 322, 3.9, () {}),
                          katalogcard(context, 'assets/images/rollsroysghost.png', 'Rolls-Royce Ghost', 'Эталон роскоши и комфорта в автомобильном мире', 25, 571, 250, 4.8, () {}),
                          katalogcard(context, 'assets/images/ferrarif8tributo.png', 'Ferrari F8 Tributo', 'Новейшая разработка Ferrari с впечатляющими характеристиками', 16, 730, 340, 2.9, () {})
                        ],
                      ),
                    );
                  } else if (constrains.maxWidth < 900) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            katalogcard(context, 'assets/images/kollection_lamborgini.png', 'Lamborghini Huracán', 'Итальянский суперкар с невероятной динамикой и завораживающим дизайном', 15, 610, 325, 3.2, () {}),
                            katalogcard(context, 'assets/images/ferrari485.png', 'Ferrari 488 GTB', 'Легендарный Ferrari с турбированным V8 и исключительными характеристиками', 15, 610, 325, 3.2, () {}),
                            katalogcard(context, 'assets/images/porsche911.png', 'Porsche 911 Turbo S', 'Британский суперкар с революционной аэродинамикой', 15, 610, 325, 3.2, () {}),
                            katalogcard(context, 'assets/images/maclaren720s.png', 'McLaren 720S', 'Британский суперкар с революционной аэродинамикой', 20, 720, 341, 2.9, () {}),
                          ],
                        ),
                        Column(
                          children: [
                            katalogcard(context, 'assets/images/bentley.png', 'Bentley Continental GT', 'Британская роскошь и комфорт в спортивном исполнении', 8, 635, 333, 3.7, () {}),
                            katalogcard(context, 'assets/images/astonmartindb11.png', 'Aston Martin DB11', 'Классическая британская элегантность с современными технологиями', 10, 630, 322, 3.9, () {}),
                            katalogcard(context, 'assets/images/rollsroysghost.png', 'Rolls-Royce Ghost', 'Эталон роскоши и комфорта в автомобильном мире', 25, 571, 250, 4.8, () {}),
                            katalogcard(context, 'assets/images/ferrarif8tributo.png', 'Ferrari F8 Tributo', 'Новейшая разработка Ferrari с впечатляющими характеристиками', 16, 730, 340, 2.9, () {})
                          ],
                        )
                      ],
                    );
                  } else if (constrains.maxWidth < 1300) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            katalogcard(context, 'assets/images/kollection_lamborgini.png', 'Lamborghini Huracán', 'Итальянский суперкар с невероятной динамикой и завораживающим дизайном', 15, 610, 325, 3.2, () {}),
                            katalogcard(context, 'assets/images/ferrari485.png', 'Ferrari 488 GTB', 'Легендарный Ferrari с турбированным V8 и исключительными характеристиками', 15, 610, 325, 3.2, () {}),
                            katalogcard(context, 'assets/images/porsche911.png', 'Porsche 911 Turbo S', 'Британский суперкар с революционной аэродинамикой', 15, 610, 325, 3.2, () {}),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            katalogcard(context, 'assets/images/maclaren720s.png', 'McLaren 720S', 'Британский суперкар с революционной аэродинамикой', 20, 720, 341, 2.9, () {}),
                            katalogcard(context, 'assets/images/bentley.png', 'Bentley Continental GT', 'Британская роскошь и комфорт в спортивном исполнении', 8, 635, 333, 3.7, () {}),
                            katalogcard(context, 'assets/images/astonmartindb11.png', 'Aston Martin DB11', 'Классическая британская элегантность с современными технологиями', 10, 630, 322, 3.9, () {}),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            katalogcard(context, 'assets/images/rollsroysghost.png', 'Rolls-Royce Ghost', 'Эталон роскоши и комфорта в автомобильном мире', 25, 571, 250, 4.8, () {}),
                            katalogcard(context, 'assets/images/ferrarif8tributo.png', 'Ferrari F8 Tributo', 'Новейшая разработка Ferrari с впечатляющими характеристиками', 16, 730, 340, 2.9, () {})
                          ],
                        )
                      ],
                    );
                  }
                  else {
                    return Center(
                      child: Container(
                        color: Colors.transparent,
                        width: width * 0.95,
                        height: height * 1.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                katalogcard(context, 'assets/images/kollection_lamborgini.png', 'Lamborghini Huracán', 'Итальянский суперкар с невероятной динамикой и завораживающим дизайном', 15, 610, 325, 3.2, () {}),
                                katalogcard(context, 'assets/images/ferrari485.png', 'Ferrari 488 GTB', 'Легендарный Ferrari с турбированным V8 и исключительными характеристиками', 15, 610, 325, 3.2, () {}),
                                katalogcard(context, 'assets/images/porsche911.png', 'Porsche 911 Turbo S', 'Британский суперкар с революционной аэродинамикой', 15, 610, 325, 3.2, () {}),
                                katalogcard(context, 'assets/images/maclaren720s.png', 'McLaren 720S', 'Британский суперкар с революционной аэродинамикой', 20, 720, 341, 2.9, () {})
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                katalogcard(context, 'assets/images/bentley.png', 'Bentley Continental GT', 'Британская роскошь и комфорт в спортивном исполнении', 8, 635, 333, 3.7, () {}),
                                katalogcard(context, 'assets/images/astonmartindb11.png', 'Aston Martin DB11', 'Классическая британская элегантность с современными технологиями', 10, 630, 322, 3.9, () {}),
                                katalogcard(context, 'assets/images/rollsroysghost.png', 'Rolls-Royce Ghost', 'Эталон роскоши и комфорта в автомобильном мире', 25, 571, 250, 4.8, () {}),
                                katalogcard(context, 'assets/images/ferrarif8tributo.png', 'Ferrari F8 Tributo', 'Новейшая разработка Ferrari с впечатляющими характеристиками', 16, 730, 340, 2.9, () {})
                              ],
                            )
                          ],
                        ),
                      )
                    );
                  }
                }
              ),
              Container(
                color: Colors.black,
                width: width,
                height: height * 0.5,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('EliteRent',
                        style: TextStyle(
                          fontSize: width < 945 ? width * 0.08 : width * 0.025,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(250, 204, 21, 1)
                        ),
                      ),
                      Text('Премиальный прокат экслюзивных автомобилей',
                        style: TextStyle(
                          fontSize: width < 945 ? width * 0.025 : width * 0.015,
                          color: Color.fromRGBO(156, 163, 175, 1)
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          appbarButtons('Главная', () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => Homescreen()));
                          }, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight, context),
                          appbarButtons('О Нас', () {}, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight, context),
                          appbarButtons('Контакты', () {}, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight, context),
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
                  ),
                ),
              )
            ],
          ),
        )
      ],
    )
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
}


Widget katalogcard (BuildContext context, String img, String label, String description, int price, int hoursePower, int kmHour, double sekund, VoidCallback function,) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
    
         return Container(
          width: width < 600 ? width * 0.8 : 300,
          height: width < 600 ? height * 0.85 : 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(img,
                  fit: BoxFit.cover,
                  width: width < 600 ? width : 300,
                  height: width < 600 ? height * 0.45 : 210,
                  ),
                ],
              ),
              Container(
                width: width < 600 ? width : 300,
                height: width < 600 ? height * 0.40 : 290,
                color: Color.fromRGBO(31, 41, 55, 1),
                child: Padding(padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(label,
                            style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(255, 255, 255, 1)
                            ),
                          )
                        ],
                      ),
                    Flexible(
                      child: Text(description,
                      style: TextStyle(
                        color: Color.fromRGBO(156, 163, 175, 1),
                        fontSize: 14
                      ),
                        maxLines: 2,
                      )
                      ),
                      Padding(padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Row(
                        children: [
                          Text('$price,000 ₽/день',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(250, 204, 21, 1)
                            ),
                          )
                        ],
                      ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 0, right: width < 600 ? width * 0.3 : width * 0.02),
                        child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                    width: 66,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(9999)),
                                      color: Color.fromRGBO(55, 65, 81, 1)
                                    ),
                                    child: Center(
                                      child: Text('$hoursePower л.c.', style: HomescreenStyle.characteristickContainerText),
                                    ),
                                  ),
                                Container(
                                    width: 66,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(9999)),
                                      color: Color.fromRGBO(55, 65, 81, 1)
                                    ),
                                    child: Center(
                                      child: Text('$sekund сек', style: HomescreenStyle.characteristickContainerText),
                                    ),
                                  ),
                                Container(
                                    width: 66,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(9999)),
                                      color: Color.fromRGBO(55, 65, 81, 1)
                                    ),
                                    child: Center(
                                      child: Text('$kmHour км/ч', style: HomescreenStyle.characteristickContainerText),
                                    ),
                                  ),
                            ],
                          ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Cards()
                      )
                    ],
                  ),
                ),
              ),
            ]
          )
        );
}

Widget appbarButtons(String label, VoidCallback navigation, TextStyle textStyle, double buttonWidth, double buttonHeight, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
      return Opacity(
        opacity: 1,
        child: SizedBox(
          width: buttonWidth, 
          height: buttonHeight, 
          child: ElevatedButton(
            style: HomescreenStyle.appbarButtonsStyle,
            onPressed: navigation,
            child: Text(
              label,
            maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: width < 945 ? width * 0.03 : width * 0.02,
                color: Color.fromRGBO(156, 163, 175, 1)
              ),
            ),
          ),
        ),
      );
    }