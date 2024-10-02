import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:payment_project/core/utils/api_keys.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    required body,
    required String url,
    Map<String, String>? headers,
  }) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: headers ?? {'Authorization': 'Bearer ${ApiKeys.secretKey}'}));
    return response;
  }

}
