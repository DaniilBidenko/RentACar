// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:rent_a_car_auto/blocs/faq/faq_bloc.dart';
// import 'package:rent_a_car_auto/blocs/faq/faq_state.dart';
// import 'package:rent_a_car_auto/data/faq_model.dart';

// class FaqItem  extends StatefulWidget{
//   final FaqModel faq;
//   FaqItem({required this.faq, Key? key}) : super(key: key);
//   @override
//   State<FaqItem> createState() => FaqItemState();
// }

// class FaqItemState extends State<FaqItem> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return BlocBuilder<FaqBloc, FaqState>(
//       builder: (context, state) {
//         return Container(
//           margin: EdgeInsets.symmetric(
//             horizontal: 50,
//             vertical: 20
//           ),
//           width: width < 600 ? width * 0.01 : width * 0.01,
//           decoration: BoxDecoration(
//             color: Color.fromRGBO(31, 41, 55, 1),
//             borderRadius: BorderRadius.all(Radius.circular(8))
//           ),
//           child: Wrap(
//             crossAxisAlignment: WrapCrossAlignment.center,
//             children: [
//              Padding(
//               padding: EdgeInsets.only(),
//                 child: Text(DateFormat('yyyy-MM-dd').format(widget.faq.publishedAt),
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.red,
//                   fontWeight: FontWeight.bold
//                 ),
//                 ),
//               ),
//              Padding(
//               padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
//               child:  Text('${widget.faq.fio} :',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Color.fromRGBO(234, 179, 8, 1),
//                   fontWeight: FontWeight.bold
//                 ),
//               ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 10, bottom: 20, top: 20),
//                 child: Text(widget.faq.kommentariy,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white
//                   ),
//                 ),
//               ),
              
//             ],
//           ),
//         );
//       }
//     );
//   }
// }