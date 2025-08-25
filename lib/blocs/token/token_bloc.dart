import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car_auto/blocs/token/token_event.dart';
import 'package:rent_a_car_auto/blocs/token/token_state.dart';
import 'package:rent_a_car_auto/repository/token_repository.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState>{
  final TokenRepository repository;
  TokenBloc({required this.repository}) : super(TokenInitial()) {
    on<TokenLoad> ((event, emit) async {
      emit(TokenLoading());
      print('1 - Starting tp load bron');
      try {
        final token = await repository.fethToken();
        emit(TokenLoaded(token));
        print('2 - Token loaded successully: ${token.length} token');
        print('3 - State emitted succesully');
      } catch (e) {
        print('Ошибка $e');
        emit(TokenError(e.toString()));
      }
     });
  }
}