import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/screens/homescreen.dart';
import 'package:rent_a_car_auto/screens/katalog_screen.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';

class AppbarButtonWidget extends StatefulWidget{
  AppbarButtonWidget({Key? key}) : super(key: key);
  @override
  State<AppbarButtonWidget> createState() => _AppBarButtonWidgetState();
}

class _AppBarButtonWidgetState extends State<AppbarButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.23,
      height: height * 0.1,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            appbarButtons('Главная', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => Homescreen()));
            }, HomescreenStyle.appbarButtonTextStyle(context)),
            appbarButtons('Каталог', () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => KatalogScreen()));
            }, HomescreenStyle.appbarButtonTextStyle(context)),
            appbarButtons('О Нас', () {}, HomescreenStyle.appbarButtonTextStyle(context)),
            appbarButtons('Контакты', () {}, HomescreenStyle.appbarButtonTextStyle(context)),
          ],
        ),
      ),
    );
  }
}

Widget appbarButtons (String label, VoidCallback navigation, TextStyle textStyle) {
  return Opacity(
    opacity: 1,
    child: ElevatedButton(
    style: HomescreenStyle.appbarButtonsStyle,
    onPressed: navigation, 
    child: Text(label,
      style: textStyle,
    )
  ),
  );
}