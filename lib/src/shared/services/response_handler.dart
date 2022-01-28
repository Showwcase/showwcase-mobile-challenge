import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_challenge/src/shared/models/custom_exception.dart';

dynamic responseHandler(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseData = json.decode(response.body.toString());
      return responseData;

    case 400:
      throw BadRequestException(response.body.toString());

    case 500:

    default:
      throw FetchDataException(
          'There was a problem while communicating with the server, status-code: ${response.statusCode}');
  }
}
