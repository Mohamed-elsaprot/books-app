import 'package:dio/dio.dart';

class ApiService{
  final url ='https://www.googleapis.com/books/v1/';

  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String,dynamic>>  get({required String endPointUrl}) async{
    var res = await _dio.get('$url$endPointUrl');
    return res.data;
  }
}