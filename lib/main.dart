import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/screens/homescreen.dart';

void main () {
  runApp(RentACar());
}

class RentACar extends StatefulWidget {
  RentACar({Key? key}) : super(key: key);
  @override
  State<RentACar> createState() => _RentACarState();
}

class _RentACarState extends State<RentACar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
    );
  }
} 