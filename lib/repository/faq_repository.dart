// import 'dart:convert';

// import 'package:rent_a_car_auto/data/faq_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FaqRepository {
//   static const String _faqKey = 'faq';
//   Future<List<FaqModel>> getAllFaq () async{
//     final prefs = await SharedPreferences.getInstance();
//     final faqJson = prefs.getStringList(_faqKey) ?? [];

//     return faqJson.map((faqStr) {
//       final faqMap = jsonDecode(faqStr) as Map<String, dynamic>;
//       return FaqModel.fromJson(faqMap);
//     }).toList();
//   }

//   Future <void> addFaq (FaqModel faqmodel) async{
//     final prefs = await SharedPreferences.getInstance();
//     final faqJson = prefs.getStringList(_faqKey) ?? [];

//     faqJson.add(jsonEncode(faqmodel.toJson()));

//     await prefs.setStringList(_faqKey, faqJson);
//   }

//   Future<void> deleteFaq(String id) async{
//     final prefs = await SharedPreferences.getInstance();
//     final faqJson = prefs.getStringList(_faqKey) ?? [];
//     final index = _findFaqIndexById(faqJson, id);

//     if (index != -1) {
//       faqJson.removeAt(index);
//       await prefs.setStringList(_faqKey, faqJson);
//     }
//   }

//   Future<void> toggleFaqStatus (String id) async{
//     final prefs = await SharedPreferences.getInstance();
//     final faqJson = prefs.getStringList(_faqKey) ?? [];
//     final index = _findFaqIndexById(faqJson, id);

//     if(index != -1) {
//       final faqMap = jsonDecode(faqJson[index]) as Map<String, dynamic>;
//       final faq = FaqModel.fromJson(faqMap);
//       final updateFaq = faq.copyWith(answered: !faq.answered);
//       faqJson[index] = jsonEncode(updateFaq.toJson());
//       await prefs.setStringList(_faqKey, faqJson);
//     }
//   }

//   Future<void> editFaq (FaqModel updateFaq) async{
//     final prefs = await SharedPreferences.getInstance();
//     final faqJson = prefs.getStringList(_faqKey) ?? [];
//     final index = _findFaqIndexById(faqJson, updateFaq.id);

//     if (index != -1) {
//       faqJson[index] = jsonDecode(updateFaq.toJson() as String);
//       await prefs.setStringList(_faqKey, faqJson);
//     }
//   }

//   int _findFaqIndexById (List<String> faqJson, String id) {
//     for(int i = 0; i < faqJson.length; i++) {
//       final faqMap = jsonDecode(faqJson[i]) as Map<String, dynamic>;
//       if (faqMap['id'] == id) {
//         return i;
//       }
//     }
//     return - 1;
//   }
// }