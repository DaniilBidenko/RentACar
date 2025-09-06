import 'package:equatable/equatable.dart';

abstract class CarsIdEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class CarsIdLoad extends CarsIdEvent{}