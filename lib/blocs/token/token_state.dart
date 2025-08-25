import 'package:equatable/equatable.dart';
import 'package:rent_a_car_auto/data/token.dart';

abstract class TokenState extends Equatable{
  @override
  List<Object> get props => [];
}

class TokenInitial extends TokenState{}

class TokenLoading extends TokenState{}

class TokenLoaded extends TokenState{
  final List<Token> token;
  TokenLoaded(this.token);
  @override
  List<Object> get props => [
    token
  ];
}

class TokenError extends TokenState{
  final String message;
  TokenError(this.message);
  @override
  List<Object> get props => [
    message
  ];
}