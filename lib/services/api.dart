import 'package:combat_food/services/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> postReq(String url, Map<String, String> body) async {
  String token = await AuthService().getUserToken();
  String authHeader = "Bearer $token";
  return http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': authHeader
    },
    body: jsonEncode(body),
  );
}

Future<http.Response> getReq(String url) async {
  String token = await AuthService().getUserToken();
  String authHeader = "Bearer $token";
  return http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': authHeader
    },
  );
}
