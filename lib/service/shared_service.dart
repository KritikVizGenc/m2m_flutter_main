import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/model/register_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_response_model.dart';

class SharedService {
   static Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.getString("login_details") != null){
      return true;
    } else {
      return false;
    }
  }

  static Future<String> loginDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? user = preferences.getString("login_details");
    if(user != null){
      return user;
    } else {
      return "";
    }
  }


  static Future<void> setLoginDetails(
      LoginResponseModel model,
      ) async {

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("login_details", jsonEncode(model));

  // async {
  //   APICacheDBModel cacheDBModel = APICacheDBModel(
  //       key: "login_details",
  //       syncData: jsonEncode(model.toJson()));
  //
  //   await APICacheManager().addCacheData(cacheDBModel);
  }


  static Future<void> logout(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("login_details");
    Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
            (route) => false
    );
  }

}