import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:users_json/Models/User.dart';

Future<List<User>> getUsers() async {
  List<User> users = [];

  final url = Uri.http("AQUI_LA_IP:3001", "/api/users");
  final response = await http.get(url);

  if (response.statusCode != 200) {
    return users;
  }
  var jsonText = response.body;

  var listJsonItems = jsonDecode(jsonText) as List;

  List<User> usersList = listJsonItems.map((e) => User.fromMap(e)).toList();

  return usersList;
}
