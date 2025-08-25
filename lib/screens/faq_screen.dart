// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rent_a_car_auto/blocs/faq/faq_bloc.dart';
// import 'package:rent_a_car_auto/blocs/faq/faq_event.dart';
// import 'package:rent_a_car_auto/data/faq_model.dart';
// import 'package:rent_a_car_auto/screens/faq_list_screen.dart';
// import 'package:rent_a_car_auto/styles/bronirovanie_style.dart';
// import 'package:rent_a_car_auto/widgets/appbar_widget.dart';

// class FaqScreen extends StatelessWidget{
//   final _formKey = GlobalKey<FormState>();
//   final faq = FaqModel;

//   final nameController = TextEditingController();
//   final telefonNumberController = TextEditingController();
//   final emailController = TextEditingController();
//   final commentController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {

//      void submitForm () {
//       if(_formKey.currentState!.validate()) {
//         _formKey.currentState!.save();
//         final newFaq = FaqModel(
//           fio: nameController.text, 
//           telefonNumber: telefonNumberController.text, 
//           email: emailController.text, 
//           kommentariy: commentController.text
//         );
//       context.read<FaqBloc>().add(AddFaq(newFaq));
//       Navigator.push(context, MaterialPageRoute(builder: (context) => FaqListScreen()));
//       }
//     }

//     @override
//     void dispose() {
//       nameController.dispose();
//       telefonNumberController.dispose();
//       emailController.dispose();
//       commentController.dispose();
//     }

//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppbarWidget(),
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: width * 0.05, bottom: width * 0.02, left: width * 0.4),
//                 child: Text('Задайте ваш вопрос',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: width * 0.02
//                 ),
//               ),
//               ),
//               Container(decoration: BoxDecoration(border: Border(top: BorderSide(color: Color.fromRGBO(31, 41, 55, 1), width: 3))),),
//               Padding(
//               padding: EdgeInsets.only(left: width * 0.03, top: height * 0.03),
//                 child: Container(
//                   width: width ,
//                   height: height * 0.5,
//                   child: Form(
//                     key: _formKey,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                        Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           textFields('Пожалуйста введите Фамилию Имя Отчество', 'Биденко Даниил Викторович', 'Фамилия Имя Отчество', context, nameController),
//                           textFields('Пожалуйста введите номер телефона', '+996 706 244 611', 'Номер телефона', context, telefonNumberController),
//                           textFields('Пожалуйста ваш адрес электронной почты', 'daniilbidenko5@gmail.com', 'E-mail', context, emailController)
//                         ],
//                       ),
//                       Container(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(bottom: height * 0.014),
//                               child: Text('Ваш комментарий',
//                                 style: BronirovanieStyle.popravka(context),
//                               ),
//                             ),
//                             Container(
//                             width: width  * 0.4,
//                             height: height * 0.2,
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(55, 65, 81, 1),
//                               borderRadius: BorderRadius.all(Radius.circular(8))
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.only(),
                              
//                                 child: TextFormField(
//                                   textAlign: TextAlign.start,
//                                   textAlignVertical: TextAlignVertical.top,
//                                   expands: true,
//                                   maxLines: null,
//                                   minLines: null,
//                                   controller: commentController,
//                                   decoration: InputDecoration(
//                                     hintText: 'Введите ваш комментарий...',
//                                     hintStyle:  TextStyle(
//                                       color: Color.fromRGBO(95, 94, 94, 1)
//                                     ), 
//                                     border: OutlineInputBorder(
//                                       borderSide: BorderSide.none
//                                     )
//                                   ),
//                                 )
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(top: height * 0.03),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Padding(padding: EdgeInsets.only(right: width * 0.24),
//                                   child: Container(
//                                     width: width * 0.07,
//                                     height: height * 0.04,
//                                     child: ElevatedButton(
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.amber
//                                       ),
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       }, 
//                                       child: Text('Отмена',
//                                         style: TextStyle(
//                                           color: Colors.black
//                                         ),
//                                       )
//                                     )
//                                   ),
//                                 ),
//                                 Container(
//                                   width: width * 0.09,
//                                   height: height * 0.04,
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.amber
//                                     ),
//                                     onPressed: submitForm,
//                                     child: Text('Отправить',
//                                       style: TextStyle(
//                                         color: Colors.black
//                                       ),
//                                     )
//                                   )
//                                 )
//                               ],
//                             ),
//                           )
                          
//                           ],
//                         ),
//                       )
                      
//                       ],
//                     ),
//                   )
//               ),
//              ),
//             ],
//           )
//       ),
//     );
//   }
 
// }

// Widget textFields (String errorText, String labelText, String popravka, BuildContext context, TextEditingController controller) {
//   double width = MediaQuery.of(context).size.width;
//   double height = MediaQuery.of(context).size.height;
//   String? header;
//   return Container(
//     width: width * 0.36,
//     height: height * 0.15,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Text(popravka, style: BronirovanieStyle.popravka(context)),
//         TextFormField(
//           autovalidateMode: AutovalidateMode.always,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return errorText;
//             }
//             return null;
//           },
//           onSaved: (value) => header = value,
//           style: TextStyle(
//             color: Color.fromRGBO(255, 255, 255, 1)
//           ),
//           controller: controller,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Color.fromRGBO(55, 65, 81, 1),
//             hintText: labelText,
//             hintStyle: TextStyle(
//               color: Color.fromRGBO(95, 94, 94, 1)
//             ),
//             border: OutlineInputBorder(
//               borderSide: BorderSide.none
//             )
//           )
//         )
//       ],
//     ),
//   );
// }

