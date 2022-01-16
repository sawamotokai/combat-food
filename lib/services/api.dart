import 'dart:collection';

import 'package:combat_food/services/auth.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

Future<String> getImageFromFirestore(String uri) async {
  return await firebase_storage.FirebaseStorage.instance
      .ref(uri)
      .getDownloadURL();
}

Future<List<dynamic>> getOrderHistory() async {
  var url = '${dotenv.env["BASE_URL"]}/api/restaurant/history';
  http.Response res = await getReq(url);
  LinkedHashMap<String, dynamic> data = jsonDecode(res.body);
  List<dynamic> orders = data['orders']!;
  print(orders);
  return orders;
}
