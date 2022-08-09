import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:m2m_flutter_main/config.dart';
import 'package:m2m_flutter_main/model/login_request_model.dart';
import 'package:m2m_flutter_main/model/login_response_model.dart';
import 'package:m2m_flutter_main/model/register_request_model.dart';
import 'package:m2m_flutter_main/model/register_response_model.dart';
import 'package:m2m_flutter_main/service/shared_service.dart';
import '../model/getAllTags_model.dart';
import '../model/getByRole_model.dart';
import '../model/getMyMentees_model.dart';
import '../model/getMyMentors_model.dart';
import '../model/getUserAll_model.dart';
import '../model/getById_model.dart';

class APIService {
  static var client = http.Client();

  static Future<LoginResponseModel> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
    }
    return loginResponseJson(response.body);
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.registerAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 201) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
    }
    return registerResponseJson(response.body);
  }
}
