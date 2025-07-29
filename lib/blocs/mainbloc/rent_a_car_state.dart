import 'package:equatable/equatable.dart';

class RentACarState extends Equatable{
  @override
  List<Object> get props => [];
}

class RentACarInitial extends RentACarState{}

class RentACarLoading extends RentACarState{}

class RentACarLoaded extends RentACarState{}

class RentACarError extends RentACarState{}