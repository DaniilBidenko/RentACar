import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class BronirovanieStyle {
  static TextStyle title (BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextStyle(
      fontSize: width < 700 ? width * 0.035 : width * 0.022,
      color: Color.fromRGBO(255, 255, 255, 1),
      fontWeight: FontWeight.w700
    );
  }

  static TextStyle popravka (BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextStyle(
      fontSize: width < 700 ? width * 0.028 : width * 0.014,
      color: Color.fromRGBO(255, 255, 255, 1),
      fontWeight: FontWeight.w600
    );
  }
}