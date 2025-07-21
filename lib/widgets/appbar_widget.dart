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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Padding(padding: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('EliteRent',
              style: HomescreenStyle.logoStyle(context),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                double buttonPaddingLeft = width < 945 ? width * 0.05 : width * 0.23;
                double buttonPaddingRight = width < 945 ? width * 0.05 : width * 0.23;

                return Padding(
                  padding: EdgeInsets.only(left: buttonPaddingLeft, right: buttonPaddingRight),
                  child: Container(
                    child: AppbarButtonWidget(),
                  ),
                );
              },
            ),
              Container(
                width: width < 945 ? width * 0.17 : width * 0.1, 
                height: width < 945 ? height * 0.03 : height * 0.05,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(234, 179, 8, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9999))
                  )
                ),
                onPressed: () {}, 
                child: Text('+7 (495) 123-45-67',
                  style: HomescreenStyle.yelowButtonsText(context),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ),
          ]
        ),
      )
    );
  }
}