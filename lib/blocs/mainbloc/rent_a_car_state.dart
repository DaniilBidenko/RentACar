import 'package:equatable/equatable.dart';
import 'package:rent_a_car_auto/data/rent_a_car_model.dart';

class RentACarState extends Equatable{
  @override
  List<Object> get props => [];
}

class RentACarInitial extends RentACarState{}

class RentACarLoading extends RentACarState{}

class RentACarLoaded extends RentACarState{
  final List<RentACarModel> rentACar;
  RentACarLoaded(this.rentACar);
  @override
  List<Object> get props => [
    rentACar
  ];
}

class RentACarError extends RentACarState{
  final String message;
  RentACarError(this.message);
  @override
  List<Object> get props => [
    message
  ];
}