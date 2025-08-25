// import 'package:equatable/equatable.dart';
// import 'package:uuid/uuid.dart';

// class FaqModel extends Equatable{
//   final String id;
//   final String fio;
//   final bool answered;
//   final String telefonNumber;
//   final String email;
//   final String kommentariy;
//   final DateTime publishedAt;

//   FaqModel({
//     String? id,
//     required this.fio,
//     this.answered = false,
//     required this.telefonNumber,
//     required this.email,
//     required this.kommentariy,
//     DateTime? publishedAt
//   }) : id = id ?? const Uuid().v4(),
//     publishedAt = publishedAt ?? DateTime.now();

//   static FaqModel fromJson (Map<String, dynamic> json) {
//     return FaqModel(
//       id: json['id'],
//       fio: json['fio'],
//       answered: json['answered'], 
//       telefonNumber: json['telefonNumber'], 
//       email: json['email'], 
//       kommentariy: json['kommentariy'],
//       publishedAt: json['publishedAt']
//     );
//   }

//   Map<String,dynamic> toJson () {
//     return {
//       'id': id,
//       'fio': fio,
//       'answered': answered,
//       'telefonNumber': telefonNumber,
//       'email': email,
//       'kommentariy': kommentariy,
//       'publishedAt': publishedAt
//     };
//   }

//   FaqModel copyWith ({
//     String? id,
//     String? fio,
//     bool? answered,
//     String? telefonNumber,
//     String? email,
//     String? kommentariy,
//     DateTime? publishedAt
//   }) {
//     return FaqModel(
//       id: id,
//       fio: fio ?? this.fio, 
//       answered: answered ?? this.answered,
//       telefonNumber: telefonNumber ?? this.telefonNumber, 
//       email: email ?? this.email, 
//       kommentariy: kommentariy ?? this.kommentariy,
//       publishedAt: publishedAt
//     );
//   }


//   List<Object> get props => [
//     id,
//     fio,
//     answered,
//     telefonNumber,
//     email,
//     kommentariy,
//     publishedAt
//   ];
// }