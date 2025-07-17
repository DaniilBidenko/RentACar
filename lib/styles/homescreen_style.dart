import 'package:flutter/material.dart';

class HomescreenStyle {

  static TextStyle logoStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Roboto'
  );

  static TextStyle appbarButtonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Roboto',
  );

  static ButtonStyle appbarButtonsStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero
    ),
    padding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
  );

  static TextStyle descriptionCenter = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(209, 213, 219, 1),
    fontFamily: 'Roboto'
  );


  static TextStyle yelowButtonsText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'Roboto'
  );

  static TextStyle topKollectionText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(156, 163, 175, 1),
    fontFamily: 'Roboto'
  );

  static TextStyle characteristickContainerText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(156, 163, 175, 1)
  );

  static TextStyle title = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(255, 255, 255, 1)
  );
}