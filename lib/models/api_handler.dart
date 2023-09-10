import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/endPoints.dart';

class ApiHandler {
  Future<http.Response> makeRequest(String url,
      {Map<String, String>? headers,
      dynamic body,
      String method = "GET"}) async {
    try {
      final uri = Uri.parse(url);
      final request = http.Request(method, uri);
      headers ?? default_header;
      request.headers.addAll(default_header);
      if (body != null) {
        request.body = jsonEncode(body);
      }
      final response = await http.Client().send(request);
      final responseString = await response.stream.bytesToString();

      return http.Response(responseString, response.statusCode);
    } catch (e) {
      rethrow;
    }
  }
}
