class ApiException implements Exception {
  final int? statusCode;
  final String message;
  ApiException(this.message, {this.statusCode});
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({String message = "Unauthorized"})
    : super(message, statusCode: 401);
}

class InternalServerException extends ApiException {
  InternalServerException({String message = "Internal Server Error"})
    : super(message, statusCode: 500);
}

class NotFoundException extends ApiException {
  NotFoundException({String message = "Not Found"})
    : super(message, statusCode: 404);
}
