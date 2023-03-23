import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zigy_assignment/Constants/constants.dart';

import '../model/model.dart';
import 'package:http/http.dart' as http;

class ApiServices with ChangeNotifier {
  ResponseData responseData = ResponseData();

  bool isLoading = false;

  getMyData() async {
    isLoading = true;
    responseData = await getAllData();
    isLoading = false;
    notifyListeners();
  }

  Future<ResponseData> getAllData() async {
    try {
      final response = await http
          .get(Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        responseData = ResponseData.fromJson(item);
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }

    return responseData;
  }
}
