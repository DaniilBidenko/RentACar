import 'package:flutter/material.dart';

class GradientText extends StatelessWidget{

  final String text;
  final TextStyle? textStyle;
  final Gradient gradient;

  const GradientText(
    this.text, {
      required this.gradient,
      this.textStyle
    });

    @override
    Widget build(BuildContext context) {
      return ShaderMask(
        shaderCallback: (bounds) => gradient.createShader(
          Rect.fromLTWH(100, 1, 0, 0),
        ),
        child: Text(text, style: textStyle),
      );
    }
}


                                                  

                                        //            Padding(
                                        //   padding: EdgeInsets.only(right: 280, left: 280),
                                        //   child: Column(
                                        //     crossAxisAlignment: CrossAxisAlignment.center,
                                        //     children: [
                                        //       Text('Отборные суперкары от ведущих мировых производителей для самых',
                                        //         style: HomescreenStyle.topKollectionText
                                        //       ),
                                        //       Text('взыскательных клиентов',
                                        //         style: HomescreenStyle.topKollectionText,
                                        //       )
                                        //     ],
                                        //   ),
                                        // ),