import 'package:flutter/material.dart';
import 'package:rent_a_car_auto/screens/catalog_screen.dart';
import 'package:rent_a_car_auto/screens/homescreen.dart';
import 'package:rent_a_car_auto/screens/katalog_screen.dart';
import 'package:rent_a_car_auto/screens/bronirovanie_screen.dart';
import 'package:rent_a_car_auto/styles/homescreen_style.dart';
import 'package:rent_a_car_auto/widgets/appbar_button_widget.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget{
  const AppbarWidget ({Key? key}) : preferredSize = const Size.fromHeight(kToolbarHeight),
  super(key: key);
  final Size preferredSize;
  State<AppbarWidget> createState() => _AppBarWidgetState();
}
enum Menu {home, katalog, aboutUs , kontakts}

class _AppBarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Padding(padding: EdgeInsets.only(top: 15),
        child: 
            LayoutBuilder(
              builder: (context, constrains) {
                if (constrains.maxWidth < 1000) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('EliteRent',
                        style: HomescreenStyle.logoStyle(context),
                      ),
                      PopupMenuButton<Menu>(
                        iconSize: width * 0.06,
                        iconColor: Colors.amber,
                        color: Colors.transparent,
                        icon: const Icon(Icons.menu),
                        onSelected: (Menu item) {},
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>> [
                          PopupMenuItem(
                            value: Menu.home,
                            child: ListTile(
                              leading: Icon(Icons.home, color: Colors.amber,),
                              title: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
                                }, 
                                child: Text('Главная',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                )
                              ),
                            )
                          ),
                          PopupMenuItem(
                            value: Menu.katalog,
                            child: ListTile(
                              leading: Icon(Icons.folder, color: Colors.amber,),
                              title: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogScreen()));
                                }, 
                                child: Text('Каталог',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                )
                              ),
                            )
                          ),
                          PopupMenuItem(
                            value: Menu.aboutUs,
                            child: ListTile(
                              leading: Icon(Icons.people, color: Colors.amber,),
                              title: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
                                }, 
                                child: Text('О нас',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                )
                              ),
                            )
                          ),
                          PopupMenuItem(
                            value: Menu.kontakts,
                            child: ListTile(
                              leading: Icon(Icons.phone, color: Colors.amber,),
                              title: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
                                }, 
                                child: Text('Контакты',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                )
                              ),
                            )
                          )
                        ]
                        )
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('EliteRent',
                        style: HomescreenStyle.logoStyle(context),
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          double buttonPaddingLeft = width < 945 ? width * 0.05 : width * 0.24;
                          double buttonPaddingRight = width < 945 ? width * 0.05 : width * 0.27;

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
                        height: width < 945 ? height * 0.05 : height * 0.05,
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
                    ],
                  );
                }
              }
            ),
      )
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