import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  String baseUrl = 'https://www.googleapis.com/books/v1/';

  ApiServices(this.dio);

  Future<Map<String, dynamic>> get({required String endPont}) async {
    var response = await dio.get('$baseUrl$endPont');
    return response.data;
  }
}
