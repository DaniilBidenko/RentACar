import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';
import 'package:rent_a_car_auto/widgets/appbar_widget.dart';
import 'package:textuality/textuality.dart';


class Homescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
          children: [
            Image.asset('assets/images/cars.png',
              fit: BoxFit.cover,
              width: width,
              height: height * 1.43,
            ),
            AppbarWidget(),
            Padding(
              padding: EdgeInsets.only(top: width * 0.235, left: width * 0.023),
              child: Container(
                width: width * 0.6,
                height: height * 0.45,
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
                              fontSize: width * 0.0635,
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
                                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 23),
                                child: Container(
                                  width: width * 0.168,
                                  height: height * 0.075,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(234, 179, 8, 1)
                                    ),
                                    onPressed: () {}, 
                                    child: Center(
                                      child: Text('Выбрать автомобиль',
                                        style: TextStyle(
                                          fontSize: width * 0.011,
                                          fontWeight: FontWeight.w900,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Roboto'
                                        ),
                                      ),
                                    )
                                  ),
                                ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 17, vertical: 23),
                                  child: Container(
                                    width: width * 0.1,
                                    height: width * 0.032,
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
                                          style: TextStyle(
                                            fontSize: width * 0.009,
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
                  style: HomescreenStyle.title
                 ),
                 Padding(padding: EdgeInsets.only(top: 30, left: 400, right: 400),
                  child: Flexible(
                    flex: 2,
                    child: Center(
                      child: Text('Отборные суперкары от ведущих мировых производителей для самых взыскательных клиентов',
                      textAlign: TextAlign.center,
                        style: HomescreenStyle.lowDescriprion,
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
          ),
          Container(
            width: 1550,
            height: 600,
            color: Color.fromRGBO(17, 24, 39, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 80, bottom: 20),
                child: Text('Премиальный сервис',
                style: HomescreenStyle.title,
                )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Исключительно обслуживание на каждом этапе',
                      style: HomescreenStyle.topKollectionText,
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    services('assets/images/Icon-133.png', 'Доставка авто', 'Бесплатная доставка в любую точку города в течение часа'),
                    services('assets/images/I-165.png', 'Страхование', 'Полное Страхование и техническая поддержка 24/7'),
                    services('assets/images/I-154.png', 'Персональный менеджер', 'Индивидуальное сопровождение и консультации'),
                    services('assets/images/I-143.png', 'Гибкие условия', 'Аренда от 1 часа до нескольких месяцев')
                  ],
                ),
                )
              ],
            )
          ),
          Container(
            width: 1550,
            height: 450,
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
                Padding(padding: EdgeInsets.only(top: 80, bottom: 20),
                  child: Text('Готовы к незабываемому опыту?',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                    color: Color.fromRGBO(0, 0, 0, 1)
                  ),
                ),
                ),
                  Padding(padding: EdgeInsets.only(left: 300, right: 300),
                    child: Flexible(
                      flex: 2,
                    child: Center(
                      child: Text('Забронируйте свой идеальный автомобиль прямо сейчас и получите скидку 10% на первую аренду',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                      ),
                      ),
                    )
                    ),
                  ),
                Padding(padding: EdgeInsets.only(top: 40,bottom: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 257.63,
                        height: 64,
                        color: Colors.transparent,
                        child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black
                        ),
                        onPressed: () {}, 
                        child: Center(
                          child: Text('Забронировать сейчас',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(255, 255, 255, 1)
                            ),
                          ),
                        )
                        ),
                      ),
                        SizedBox(width: 15,),
                        Container(
                          width: 257.63,
                          height: 64,
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
                                fontSize: 18,
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
            width: 1550,
            height: 350,
            color: Color.fromRGBO(0, 0, 0, 1),
            child: Column(  
              children: [
                Padding(
                  padding: EdgeInsets.all(50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 296,
                        height: 164,
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
                              style: HomescreenStyle.lowDescriprion,
                              )
                            ),
                           Padding(padding: EdgeInsets.only(left: 0, right: 150),
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
                      lowContainer('Автомобили', 'Люкс класс', 'Спорткар', 'Экзотическое', 'Классические'),
                      lowContainer('Услуги', 'Доставка', 'С водителем', 'Мероприятия', 'Долгосрочная аренда'),
                      lowContainer('Контакты', '+7 (495) 123-45-67', 'info@elitrent.ru', 'Москва, ул. Тверская, 15', 'Работаем 24/7')
                    ],
                  ),
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
                        style: HomescreenStyle.lowDescriprion,
                      ),
                    )
                  ),
                ),
              ],
            )
          ),
        ],
      )
    );
  }
}

Widget lowContainer (String title, String descriprion, String firstDescriprion, String secondDescription, String trheeDescription) {
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
          style: HomescreenStyle.lowDescriprion
        ),
        Text(firstDescriprion,
          style: HomescreenStyle.lowDescriprion),
        Text(secondDescription,
          style: HomescreenStyle.lowDescriprion),
        Text(trheeDescription,
          style: HomescreenStyle.lowDescriprion)
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