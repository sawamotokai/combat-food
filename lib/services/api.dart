import 'package:combat_food/services/auth.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
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

Future<List<Map<String, String>>> getOrderHistory() async {
  String url = 'https://combat-food.herokuapp.com/api/orders';
  http.Response response = await getReq(url);
  Map<String, dynamic> data = jsonDecode(response.body);
  Map<String, String> orderHistory = Map<String, String>();
  data['orders'].forEach((order) {
    orderHistory[order['id']] = order['status'];
  });
  return [];
}
