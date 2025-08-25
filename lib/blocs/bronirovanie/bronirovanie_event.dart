import 'package:equatable/equatable.dart';
import 'package:rent_a_car_auto/data/bronirovanie.dart';

abstract class BronirovanieEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class BronirovanieLoad extends BronirovanieEvent{}

class BronirovanieCustAdd extends BronirovanieEvent{
  final BronirovanieCustomer broncust;
  BronirovanieCustAdd(this.broncust);
  @override
  List<Object> get props => [
    broncust
  ];
}
