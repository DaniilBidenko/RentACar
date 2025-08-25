// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rent_a_car_auto/blocs/faq/faq_bloc.dart';
// import 'package:rent_a_car_auto/blocs/faq/faq_state.dart';
// import 'package:rent_a_car_auto/data/faq_model.dart';
// import 'package:rent_a_car_auto/screens/faq_screen.dart';
// import 'package:rent_a_car_auto/widgets/appbar_widget.dart';
// import 'package:rent_a_car_auto/widgets/faq_item.dart';

// class FaqListScreen extends StatefulWidget{
  
//   FaqListScreen({ Key? key}) : super(key: key);
//   @override
//   State<FaqListScreen> createState () => FaqListScreenState();
// }

// class FaqListScreenState extends State<FaqListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppbarWidget(),
//       body: RefreshIndicator(
//         child: BlocBuilder<FaqBloc, FaqState>(
//           builder: (context, state) {
//             if (state is FaqLoading) {
//               return CircularProgressIndicator();
//             } else if (state is FaqLoaded) {
//               return state.faqmodel.isEmpty ? _buildEmptyState() : _buildFaqList(state);
//             } else if (state is FaqError) {
//               return Center(
//                 child: Text('Ошибка загрузки'),
//               );
//             } else {
//               return Center(
//                 child: Text('Все пошло по бороде'),
//               );
//             }
//           }
//         ), 
//         onRefresh: () async{
//           return Future<void>.delayed(const Duration(seconds: 3));
//         }
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Color.fromRGBO(17, 24, 39, 1),
//         child: Text('Задай свой вопрос',
//         textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Color.fromRGBO(234, 179, 8, 1),
//             fontSize: 10
//           ),
//         ),
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => FaqScreen()));
//         }
//       ),
//     );
//   }
// }

// Widget _buildEmptyState () {
//   return Center(
//     child: Text('Вопросов пока нет',
//       style: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         color: Colors.white
//       ),
//     ),
//   );
// }

// Widget _buildFaqList(FaqLoaded state) {
//   final faqs = state.faqmodel;
//   return ListView.builder(
//     itemCount: faqs.length,
//     itemBuilder: (context, index) {
//       return FaqItem(
//         faq: faqs[index],
//         key: ValueKey('faq_${faqs[index].id}_${DateTime.now().millisecondsSinceEpoch}'),
//       );
//     }
//   );
// }