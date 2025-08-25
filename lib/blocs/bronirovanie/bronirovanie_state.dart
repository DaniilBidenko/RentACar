import 'package:equatable/equatable.dart';
import 'package:rent_a_car_auto/data/bronirovanie.dart';

abstract class BronirovanieState extends Equatable{
  @override
  List<Object> get props => [];
}

class BronirovanieInitial extends BronirovanieState{}

class BronirovanieLoading extends BronirovanieState{}

class BronirovanieLoaded extends BronirovanieState{
  final List<Bronirovanie> bron;
  BronirovanieLoaded(this.bron);
  @override
  List<Object> get props => [
    bron,
  ];
}

class BronirovanieError extends BronirovanieState{
  final String message;
  BronirovanieError(this.message);
  @override
  List<Object> get props => [
    message
  ];
}