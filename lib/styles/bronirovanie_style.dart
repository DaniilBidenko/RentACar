import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class BronirovanieStyle {
  static TextStyle title (BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextStyle(
      fontSize: width * 0.02,
      color: Color.fromRGBO(255, 255, 255, 1),
      fontWeight: FontWeight.w700
    );
  }

  static TextStyle popravka (BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextStyle(
      fontSize: width * 0.01,
      color: Color.fromRGBO(255, 255, 255, 1),
      fontWeight: FontWeight.w600
    );
  }
}