import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure{
  final String errorMessage;
  const Failure(this.errorMessage);
}


class AuthFailure extends Failure{
  const AuthFailure(String errorMessage) : super(errorMessage);

  factory AuthFailure.fromFirebase(FirebaseAuthException ex){
    if (ex.code == 'weak-password') {
      return const AuthFailure('weak password');
    } else if (ex.code == 'email-already-in-use') {
      return const AuthFailure('email-already-in-use');
    }else if (ex.code == 'user-not-found') {
      return const AuthFailure('user-not-found');
    }else if (ex.code == 'wrong-password') {
      return const AuthFailure('wrong-password');
    }
    else if (ex.code == 'invalid-email') {
      return const AuthFailure('invalid email format');
    }else if(ex.code == 'network-request-failed'){
      return const AuthFailure('network request failed');
    }else {//ex.toString()
      print('Auth error:  ${ex.toString()}');
      return const AuthFailure('some thing wrong in connection');
    }
  }
}

class ServerFailure extends Failure{
  ServerFailure(String errorMessage) : super(errorMessage);

  factory ServerFailure.fromDioError(DioError dioError){
    switch(dioError.type){

      case DioErrorType.connectionTimeout:
       return ServerFailure('Connection timeout with ApiServer');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioErrorType.badCertificate:
        return ServerFailure('There was BadCertificate error');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure('Request with Api was canceled');

      case DioErrorType.connectionError:
        return ServerFailure('There was connection error');

      case DioErrorType.unknown:
        return ServerFailure('Something wrong in connection !');

      default:return ServerFailure('Unexpected problem, Please try again !');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic res){
    if(statusCode == 400||statusCode == 401||statusCode == 403){
      return ServerFailure(res['error']['message']);
    }else if(statusCode == 404){
      return ServerFailure('Your request not found, Please try later!');
    }else if(statusCode == 500){
      return ServerFailure('Internal server error, Please try later!');
    }else{
      return ServerFailure('Opps There was an error, PLease try again!');
    }
  }


}