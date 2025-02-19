import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection time out with api');

      case DioExceptionType.sendTimeout:
        return ServerFailure('send time out with api');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('recive time out with api');

      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with api');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response);

      case DioExceptionType.cancel:
        return ServerFailure('Request to api was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('connection error');

      case DioExceptionType.unknown:
        return ServerFailure('opps there was an error, please try again');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('your request was not found, plesae try later');
    } else if (statusCode == 500) {
      return ServerFailure('there is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('Opps,There was an error, Please try again');
    }
  }
}
