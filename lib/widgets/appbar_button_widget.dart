import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';

class AppbarButtonWidget extends StatefulWidget{
  AppbarButtonWidget({Key? key}) : super(key: key);
  @override
  State<AppbarButtonWidget> createState() => _AppBarButtonWidgetState();
}

class _AppBarButtonWidgetState extends State<AppbarButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.75,
      height: 24,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            appbarButtons('Главная', () {}),
            appbarButtons('Каталог', () {}),
            appbarButtons('О Нас', () {}),
            appbarButtons('Контакты', () {}),
          ],
        ),
      ),
    );
  }
}

Widget appbarButtons (String label, VoidCallback navigation) {
  return Opacity(
    opacity: 0.7,
    child: ElevatedButton(
    style: HomescreenStyle.appbarButtonsStyle,
    onPressed: navigation, 
    child: Text(label,
      style: HomescreenStyle.appbarButtonTextStyle,
    )
  ),
  );
}