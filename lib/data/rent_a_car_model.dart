import 'package:uuid/uuid.dart';

class RentACarModel {
  final String id;
  final String brand;
  final String model;
  final int year;
  final String classAuto;
  final int horsepower;
  final List<String> photos;
  final String description;
  final List<String> featers;
  final String pricePerDay;
  final String status;

  RentACarModel({
    String? id,
    required this.brand,
    required this.model,
    required this.year,
    required this.classAuto,
    required this.horsepower,
    required this.photos,
    required this.description,
    required this.featers,
    required this.pricePerDay,
    required this.status
  }) :
  id = id ?? const Uuid().v4();

  RentACarModel copyWith ({
    String? id,
    String? brand,
    String? model,
    int? year,
    String? classAuto,
    int? horsepower,
    List<String>? photos,
    String? description,
    List<String>? featers,
    String? pricePerDay,
    String? status
  }) {
    return RentACarModel(
      id: id,
      brand: brand ?? this.brand, 
      model: model ?? this.model, 
      year: year ?? this.year, 
      classAuto: classAuto ?? this.classAuto, 
      horsepower: horsepower ?? this.horsepower, 
      photos: photos ?? this.photos, 
      description: description ?? this.description, 
      featers: featers ?? this.featers, 
      pricePerDay: pricePerDay ?? this.pricePerDay, 
      status: status ?? this.status
      );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'model': model,
      'year': year,
      'classAuto': classAuto,
      'horsepower': horsepower,
      'photos': photos,
      'description': description,
      'featers': featers,
      'pricePerDay': pricePerDay,
      'status': status
    };
  }

  static RentACarModel fromJson(Map<String, dynamic> json) {
    return RentACarModel(
      id: json['id'] as String,
      brand: json['brand'] as String, 
      model: json['model'] as String, 
      year: json['year'] as int, 
      classAuto: json['classAuto'] as String, 
      horsepower: json['horsepower'] as int, 
      photos: json['photos'] as List<String>, 
      description: json['description'] as String, 
      featers: json['featers'] as List<String>, 
      pricePerDay: json['pricePerDay'] as String, 
      status: json['status'] as String
    );
  }

  @override
  List<Object?> get props => [
    id,
    brand,
    model,
    year,
    classAuto,
    horsepower,
    photos,
    description,
    featers,
    pricePerDay,
    status
  ];
}