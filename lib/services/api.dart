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
  print("STUB! TODO:");
  String url =
      await firebase_storage.FirebaseStorage.instance.ref(uri).getDownloadURL();
  print(url);
  return url;
}

Future<List<dynamic>> getOrderHistory() async {
  var url = '${dotenv.env["BASE_URL"]}/api/restaurant/history';
  http.Response res = await getReq(url);
  LinkedHashMap<String, dynamic> data = jsonDecode(res.body);
  List<dynamic> orders = data['orders']!;
  return orders;
}

Future<Map<String, dynamic>> getExploreItems() async {
  http.Response res = await postReq('${dotenv.env["BASE_URL"]}/products', {});
  print(res.body);
  LinkedHashMap<String, dynamic> data = jsonDecode(res.body);
  List<dynamic> ret = data['products']!;
  print(ret);
  List<String> images = [];
  for (int i = 0; i < ret.length; i++) {
    images.add(await getImageFromFirestore(ret[i]['imageUrl']));
  }
  Map<String, dynamic> ret2 = {
    'data': ret,
    'images': images,
  };
  return ret2;
}
