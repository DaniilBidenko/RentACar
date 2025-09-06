import 'package:equatable/equatable.dart';
import 'package:rent_a_car_auto/data/cars_id_model.dart';
import 'package:rent_a_car_auto/data/rent_a_car_model.dart';

abstract class CarsIdState extends Equatable{
  @override
  List<Object> get props => [];
}

class CarsIdInitial extends CarsIdState{}

class CarsIdLoading extends CarsIdState{}

class CarsIdLoaded extends CarsIdState{
  final List<CarsIdModel> idCar;
  CarsIdLoaded(this.idCar);
  @override
  List<Object> get props => [
    idCar
  ];
}

class CarsIdError extends CarsIdState {
  final String message;
  CarsIdError(this.message);
  @override
  List<Object> get props => [
    message
  ];
}