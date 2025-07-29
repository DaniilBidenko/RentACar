import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/sliders/services_slider_bloc.dart';

class ServicesSlider extends StatelessWidget{
  
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesSliderBloc, int>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constrains) {
            if (constrains.maxWidth < 945) {
            return Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int page) {
                        context.read<ServicesSliderBloc>().servicesslider();
                      },
                      children: [
                        smallServises('assets/images/Icon-133.png', 'Доставка авто', 'Бесплатная доставка в любую точку города в течение часа'),
                        smallServises('assets/images/I-165.png', 'Страхование', 'Полное Страхование и техническая поддержка 24/7'),
                        smallServises('assets/images/I-154.png', 'Персональный менеджер', 'Индивидуальное сопровождение и консультации'),
                        smallServises('assets/images/I-143.png', 'Гибкие условия', 'Аренда от 1 часа до нескольких месяцев')
                      ],
                    ),
                  ),
                ],
              );
            } else if (constrains.maxWidth < 1200) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      services('assets/images/Icon-133.png', 'Доставка авто', 'Бесплатная доставка в любую точку города в течение часа'),
                      services('assets/images/I-165.png', 'Страхование', 'Полное Страхование и техническая поддержка 24/7'),
                    ],
                  ), 
                  Column(
                    children: [
                      services('assets/images/I-154.png', 'Персональный менеджер', 'Индивидуальное сопровождение и консультации'),
                      services('assets/images/I-143.png', 'Гибкие условия', 'Аренда от 1 часа до нескольких месяцев')
                    ],
                  )
                ],
              );
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (int page) {
                        context.read<ServicesSliderBloc>().servicesslider();
                      },
                      itemBuilder: (contex, page) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            services('assets/images/Icon-133.png', 'Доставка авто', 'Бесплатная доставка в любую точку города в течение часа'),
                            services('assets/images/I-143.png', 'Страхование', 'Полное Страхование и техническая поддержка 24/7'),
                            services('assets/images/I-154.png', 'Персональный менеджер', 'Индивидуальное сопровождение и консультации'),
                            services('assets/images/I-165.png', 'Гибкие условия', 'Аренда от 1 часа до нескольких месяцев'),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          }
        );
      }
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

Widget smallServises (String img, String label, String descriprion) {
  PageController controller = PageController();
    return BlocBuilder<ServicesSliderBloc, int>(
      builder: (context, state) {
        return Container(
          width: 300,
          height: 200,
          child: Center(
            child: Column(
              children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(99)),
                        color: Color.fromRGBO(234, 179, 8, 1)
                      ),
                      child: Center(
                        child: Image.asset(img,
                        width: 31.25,
                        height: 30,
                        ),
                      ),
                    ),
                  ],
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
                    child: Text(descriprion,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(156, 163, 175, 1)
                  ),
                    ),
                  )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 4; i++) 
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: state == i ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          ),
        );
      }
    );
}