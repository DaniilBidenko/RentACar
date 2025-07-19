import 'package:flutter/material.dart';

class HomescreenStyle {

  static TextStyle logoStyle (BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return TextStyle(
    fontSize: width * 0.018,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Roboto'
    );
  }

  static TextStyle appbarButtonTextStyle (BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextStyle(
    fontSize: width * 0.01,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Roboto',
    );
  }

  static ButtonStyle appbarButtonsStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero
    ),
    padding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent
  );

  static TextStyle descriptionCenter (BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return TextStyle(
      fontSize: width * 0.0155,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(209, 213, 219, 1),
    fontFamily: 'Roboto'
    );
  }


  static TextStyle yelowButtonsText (BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return TextStyle(
    fontSize: width * 0.0079,
    fontWeight: FontWeight.w900,
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'Roboto'
    );
  }

  static TextStyle topKollectionText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(156, 163, 175, 1),
    fontFamily: 'Roboto'
  );

  static TextStyle characteristickContainerText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(156, 163, 175, 1),
    fontFamily: 'Roboto'
  );

  static TextStyle title = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Roboto'
  );

  static TextStyle experience = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: 'Roboto'
  );

  static TextStyle lowTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Roboto'
  );

  static TextStyle lowDescriprion = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(156, 163, 175, 1),
    fontFamily: 'Roboto'
  );

  static Shader orangeGradientText = LinearGradient(
    colors: <Color>[Color.fromRGBO(12, 11, 6, 1), Color.fromRGBO(248, 247, 244, 1)],
  ).createShader(Rect.fromLTWH(20, 5, 50, 30));
}
