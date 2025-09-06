import 'package:equatable/equatable.dart';

class CarsIdModel extends Equatable{
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

  CarsIdModel({
    required this.id,
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
  });  

  static CarsIdModel fromJson(Map<String, dynamic> json) {
    return CarsIdModel(
      id: json['id'] ?? '',
      brand: json['brand'] ?? '', 
      model: json['model'] ?? '', 
      year: json['year'] ?? '0' , 
      classAuto: json['classAuto'] ?? '', 
      horsepower: json['horsepower'] ?? '0' , 
      photos: (json['photos'] as List?)?.map((photos) => photos.toString()).toList() ?? [], 
      description: json['description'] ?? '', 
      featers: (json['features'] as List?)?.map((photos) => photos.toString()).toList() ?? [], 
      pricePerDay: json['pricePerDay'] ?? '0' , 
      status: json['status'] ?? ''
    );
  }

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

class CarsIdResponse {
  final bool success;
  final List<CarsIdModel> data;
  final int total;

  CarsIdResponse({
    required this.success,
    required this.data,
    required this.total
  });

  factory CarsIdResponse.fromJson(Map<String, dynamic> json) {
    return CarsIdResponse(
      success: json['success'] ?? false, 
      data: (json['data'] as List?)?.map((car) => CarsIdModel.fromJson(car)).toList() ?? [], 
      total: json['total'] ?? 0
    );
  }
}