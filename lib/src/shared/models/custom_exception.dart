class CustomException implements Exception {
  final String? message;
  final String? prefix;

  CustomException({
    this.message = 'Something went wrong!',
    this.prefix = '',
  });

  @override
  String toString() => "$prefix$message";
  //String toString() => 'CustomException(message: $message, prefix: $prefix)';
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message: message, prefix: "Error during communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message])
      : super(message: message, prefix: "Invalid Request: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message])
      : super(message: message, prefix: "Invalid Input: ");
}
