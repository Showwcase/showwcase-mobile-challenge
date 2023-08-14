import 'dart:io';

import 'package:showwcase_flutter_challenge/app/core/model/service_model/response_http_data.dart';
import 'package:showwcase_flutter_challenge/app/core/util/default_value.dart';
import 'package:http/http.dart' as http;


/**
 * We wil use this class for the http services sucs as Get,post,delete ,etc.
 */
class HttpService {
  late String baseUrl;

  HttpService() {
    initData();
  }

  Future<ResponseHttpData> getData(uri) async {
    try {
      // ,headers: getHeader()
      var url = Uri.parse(baseUrl + uri);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return ResponseHttpData('', 200, response.body, true);
      } else {
        return ResponseHttpData(
            'Something went wrong status code', response.statusCode, '', false);
      }
    } on FormatException catch (_) {
      return ResponseHttpData('Something went wrong on server', 400, '', false);
    } on SocketException catch (_) {
      return ResponseHttpData(
          'Something went wrong with internet', 400, '', false);
    } catch (e) {
      return ResponseHttpData('Something went wrong', 400, '', false);
    }
  }

  initData() {
    baseUrl = "$dAPI";
  }
}
