import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';
import 'package:rent_a_car_auto/widgets/appbar_button_widget.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget{
  const AppbarWidget ({Key? key}) : preferredSize = const Size.fromHeight(kToolbarHeight),
  super(key: key);
  final Size preferredSize;
  State<AppbarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Padding(padding: EdgeInsets.only(top: 24, right: 32, bottom: 24, left: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('EliteRent',
              style: HomescreenStyle.logoStyle,
            ),
            Container(
              child: AppbarButtonWidget(),
            ),
            Container(
              width: 189.34,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(234, 179, 8, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9999))
                  )
                ),
                onPressed: () {}, 
                child: Text('+7 (495) 123-45-67',
                  style: HomescreenStyle.yelowButtonsText
                ),
              )
            ),
          ]
        ),
      )
    );
  }
}