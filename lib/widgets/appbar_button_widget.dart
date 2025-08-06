import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/screens/catalog_screen.dart';
import 'package:rent_a_car_auto/screens/faq_screen.dart';
import 'package:rent_a_car_auto/screens/homescreen.dart';
import 'package:rent_a_car_auto/screens/katalog_screen.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';

class AppbarButtonWidget extends StatefulWidget {
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
      width: width < 945 ? width * 0.5 : width * 0.23, 
      height: width < 945 ? height * 0.05 : height * 0.08,
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double buttonWidth = constraints.maxWidth / 4; 
            double buttonHeight = constraints.maxHeight;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                appbarButtons('Главная', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Homescreen()));
                }, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                appbarButtons('Каталог', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CatalogScreen()));
                }, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                appbarButtons('FAQ', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FaqScreen()));
                }, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),
                appbarButtons('Контакты', () {}, HomescreenStyle.appbarButtonTextStyle(context), buttonWidth, buttonHeight),

              ],
            );
          },
        ),
      ),
    );
  }
}

Widget appbarButtons(String label, VoidCallback navigation, TextStyle textStyle, double buttonWidth, double buttonHeight) {
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
          style: textStyle,
        ),
      ),
    ),
  );
}
