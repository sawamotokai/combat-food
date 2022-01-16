import 'package:dio/dio.dart';
import 'package:combat_food/services/auth.dart';

Future<dynamic> postReq(String url, dynamic body) async {
  String token = await AuthService().getUserToken();
  String authHeader = "Bearer $token";

  Dio dio = new Dio();

  FormData formData = FormData.fromMap(body);

  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers["Authorization"] = authHeader;

  return await dio.post(
    url,
    data: formData,
  );
}
