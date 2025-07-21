import 'package:flutter/material.dart';

class ServicesSlider extends StatefulWidget{
  ServicesSlider({Key? key}) : super(key: key);
  @override
  State<ServicesSlider> createState() => _ServicesSliderState();
}

class _ServicesSliderState extends State<ServicesSlider>{
  final PageController _pageController = PageController();
  int _currentpage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              services('assets/images/Icon-133.png', 'Доставка авто', 'Бесплатная доставка в любую точку города в течение часа'),
              services('assets/images/I-165.png', 'Страхование', 'Полное Страхование и техническая поддержка 24/7'),
              services('assets/images/I-154.png', 'Персональный менеджер', 'Индивидуальное сопровождение и консультации'),
              services('assets/images/I-143.png', 'Гибкие условия', 'Аренда от 1 часа до нескольких месяцев')
            ],
          ),
        ),
         Row(
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
        ),
      ],
    );
  }
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
