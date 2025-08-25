import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Bronirovanie extends Equatable{
  final String id;
  final String cardId;
  final String customerId;
  final int totalDays;
  final String pricePerDay;
  final String totalPrice;
  final String discount;
  final String finalPrice;
  final String status;
  final String brand;
  final String model;
  final int year;
  final String carClass;


  Bronirovanie({
    this.id = '0',
    this.cardId = '0',
    this.customerId = '0',
    this.discount = '0',
    required this.finalPrice,
    required this.pricePerDay,
    this.status = '0',
    required this.totalDays,
    required this.totalPrice,
     required this.brand,
    required this.carClass,
    required this.model,
    required this.year
  });

  static Bronirovanie fromJson (Map<String, dynamic> json) {
     final car = json['data']['car'];
    return Bronirovanie(
      id: json['id'] ?? '', 
      cardId: json['cardId'] ?? '', 
      customerId: json['customerId'] ?? '', 
      discount: json['discount'] ?? '', 
      finalPrice: json['finalPrice'] ?? '', 
      pricePerDay: json['pricePerDay'] ?? '', 
      status: json['status'] ?? '', 
      totalDays: json['totalDays'] ?? '0', 
      totalPrice: json['totalPrice'] ?? '',
      brand: car['brand'] ?? '', 
      carClass: car['carClass'] ?? '', 
      model: car['model'] ?? '', 
      year: car['year'] ?? ''
    );
  }

  @override
  List<Object> get props => [
    id,
    cardId,
    customerId,
    discount,
    status,
    totalDays,
    totalPrice,
    finalPrice,
    pricePerDay,
    brand,
    carClass,
    model,
    year
  ];
}


class BronirovanieCustomer extends Equatable {
  final String firstName;
  final String lastName;
  final String phone;
  final DateTime startDate;
  final DateTime endDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String comment;

  BronirovanieCustomer({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.comment,
    required this.endDate,
    required this.endTime,
    required this.startDate,
    required this.startTime
  });

  factory BronirovanieCustomer.fromJson(Map<String, dynamic> json) {
    final customer = json['data']['customer'];
    return BronirovanieCustomer(
      firstName: customer['firstName'] ?? '', 
      lastName: customer['lastName'] ?? '', 
      startDate: json['startDate'], 
      endDate: json['endDate'],
      phone: customer['phone'] ?? '',
      startTime: json['startTime'],
      endTime: json['endTime'],
      comment: json['comment'],

    );
  }

  @override
  List<Object> get props => [
    firstName,
    lastName,
    phone,
    comment,
    endDate,
    endTime,
    startDate,
    startTime
  ];
}

class BronirovanieResponse extends Equatable {
  final bool success;
  final List<Bronirovanie> data;
  final String message;

  BronirovanieResponse({
    required this.data,
    required this.message,
    required this.success
  });

  factory BronirovanieResponse.fromJson(Map<String, dynamic> json) {
    return BronirovanieResponse(
      data: json['data'], 
      message: json['message'], 
      success: json['success']
    );
  }

  @override
  List<Object> get props => [
    data,
    message,
    success
  ];
}