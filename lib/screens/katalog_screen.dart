import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/widgets/appbar_widget.dart';

class KatalogScreen extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppbarWidget(),
    body: ListView(
      children: [
       Padding(padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(0),
              child: Text('Каталог Автомобилей',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: Colors.white
              ),
              ),
              ),
              Padding(padding: EdgeInsets.only(right: 350, left: 350, top: 20),
                    child: Flexible(
                      flex: 2,
                      child: Text('Выберите идеальный автомобиль из нашей эксклюзивной коллекции премиальных суперкаров',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                          color: Color.fromRGBO(156, 163, 175, 1)
                        ),
                      )
                      ),
              ),
              Padding(padding: EdgeInsets.only(),
              child: Row(
                children: [

                ],
              ),
              )
            ],
          ),
        ),
       )
      ],
    )
  );
}

Widget classAuto (Color buttonColor, VoidCallback navigation, String label, Color textColor) {
    return Container(
      width: 171.11,
      height: 48,
      color: Colors.transparent,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(9999))
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor
        ),
        onPressed: navigation, 
        child: Center(
          child: Text(label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor
          ),
          ),
        )
      ),
    );
}
}