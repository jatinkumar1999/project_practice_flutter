import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_project_flutter/modal/user_modal.dart';

class UserController extends ChangeNotifier {
  String baseUrl = "https://reqres.in/";
  String endPoint = "api/users?page=2";
  UserModal? userModal;
  bool loading = false;

  Future getUsers() async {
    loading = true;
    http.Response res = await http.get(Uri.parse(baseUrl + endPoint));
    log("=============>>>${res.body}");
    loading = false;

    if (res.statusCode == 200) {

      userModal = UserModal.fromJson(jsonDecode(res.body));

      notifyListeners();
    }
    notifyListeners();
  }
}
