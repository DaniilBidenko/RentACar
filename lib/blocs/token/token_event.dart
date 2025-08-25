import 'package:equatable/equatable.dart';

abstract class TokenEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class TokenLoad extends TokenEvent{}