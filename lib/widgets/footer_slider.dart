import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';

class FooterSlider extends StatefulWidget{
  FooterSlider({Key? key}) : super(key: key);
  @override
  State<FooterSlider> createState() => _FooterSliderState();
}

class _FooterSliderState extends State<FooterSlider> {
 final PageController _pageController = PageController();
  int _currentpage = 2;

  @override
  void dispose() {
      _pageController.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
       SizedBox(
        height: 200,
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentpage = page;
            });
          },
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
                  style: HomescreenStyle.lowDescriprion(context),
                  )
                ),
                Padding(padding: EdgeInsets.only(left: 0, right: width * 0.60),
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
       Padding(padding: EdgeInsets.only(top: 20),
       child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(4, (index) {
            return Container (
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentpage == index ? Colors.amber : Colors.white
              ),
            );
          })
        ),)
      ]
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