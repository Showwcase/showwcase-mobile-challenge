import 'dart:convert';

import 'package:http/http.dart' as http;

dynamic responseHandler(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseData = json.decode(response.body.toString());
      return responseData;

    case 400:
      throw Exception('UNAUTHORIZED::: ${response.body}');

    case 500:
    default:
      throw Exception('SERVER ERROR::: ${response.statusCode}');
  }
}
