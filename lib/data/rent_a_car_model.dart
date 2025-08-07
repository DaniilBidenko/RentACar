import 'package:equatable/equatable.dart';

class RentACarModel extends Equatable{
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
  // RentACarModel copyWith ({
  //   String? id,
  //   String? brand,
  //   String? model,
  //   int? year,
  //   String? classAuto,
  //   int? horsepower,
  //   List<String>? photos,
  //   String? description,
  //   List<String>? featers,
  //   String? pricePerDay,
  //   String? status
  // }) {
  //   return RentACarModel(
  //     id: id ?? this.id,
  //     brand: brand ?? this.brand, 
  //     model: model ?? this.model, 
  //     year: year ?? this.year, 
  //     classAuto: classAuto ?? this.classAuto, 
  //     horsepower: horsepower ?? this.horsepower, 
  //     photos: photos ?? this.photos, 
  //     description: description ?? this.description, 
  //     featers: featers ?? this.featers, 
  //     pricePerDay: pricePerDay ?? this.pricePerDay, 
  //     status: status ?? this.status
  //     );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'brand': brand,
  //     'model': model,
  //     'year': year,
  //     'classAuto': classAuto,
  //     'horsepower': horsepower,
  //     'photos': photos,
  //     'description': description,
  //     'featers': featers,
  //     'pricePerDay': pricePerDay,
  //     'status': status
  //   };
  // }

  static RentACarModel fromJson(Map<String, dynamic> json) {
    return RentACarModel(
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

class CarsResponse {
  final bool success;
  final List<RentACarModel> data;
  final int total;

  CarsResponse({
    required this.success,
    required this.data,
    required this.total
  });

  factory CarsResponse.fromJson(Map<String, dynamic> json) {
    return CarsResponse(
      success: json['success'] ?? false, 
      data: (json['data'] as List?)?.map((car) => RentACarModel.fromJson(car)).toList() ?? [], 
      total: json['total'] ?? 0
    );
  }
}