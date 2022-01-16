import 'package:dio/dio.dart';
import 'package:combat_food/services/auth.dart';

Future<void> postReq(String url, dynamic body) async {
  String token = await AuthService().getUserToken();
  String authHeader = "Bearer $token";
}
