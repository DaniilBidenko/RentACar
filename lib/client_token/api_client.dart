import 'package:dio/dio.dart';
import 'package:rent_a_car_auto/client_token/token_storage.dart';

class ApiClient {
  final Dio dio;
  final TokenStorage storage;
  static const String baseUrl = 'http://localhost:3000/api';

  ApiClient(this.storage) : dio = Dio(BaseOptions(
    baseUrl: baseUrl, 
    headers: {'Content-Type': 'application/json'}
    )
  ) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async{
        final token = await storage.read();
        if(token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (e, handler) async {
        if(e.response?.statusCode == 401) {
          await storage.clear();
        }
        handler.next(e);
      }
    )
  );
  }
}