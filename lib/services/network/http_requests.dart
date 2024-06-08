import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../../utils/main_utils.dart';
import '../cache/cache_manager.dart';

class HttpRequests {

  static bool isLogin = false, isWorking = false;
  static String _token = "";


  static void logout() {
    CacheManager.removeToken();
    CacheManager.removeWorking();
    _token = CacheManager.token;
    isWorking = CacheManager.working;
    isLogin = _token.isEmpty ? false : true ;
  }

  static Future init() async {
    await CacheManager.initAuth((p) {
      _token = CacheManager.token;
      isWorking = CacheManager.working;
      isLogin = _token.isEmpty ? false : true ;
    });

    print("the token: $_token");
  }

  static String setToken(String token) {
    CacheManager.setToken(token);
    isLogin = token.isEmpty ? false : true ;
    _token = token;
    return _token;
  }

  static Future post(String path, {body, Enableencoding=false}) async {
    Uri uri = Uri.parse(path);
    var request = await http.post(
      uri,
      headers: {
        if(Enableencoding)
        ...({'Content-Type': 'application/json'}),

      },
      body: Enableencoding?jsonEncode(body):body
    );

    print("$path-> ${request.body}");

    if(request.statusCode == 400) {
      return jsonDecode(request.body);
    }

    if(request.statusCode != 200) {
      return;
    }

    return jsonDecode(request.body);
  }


  static Future<dynamic> get(String path, {Map<String, String>? headers}) async {
    Uri uri = Uri.parse(path);
    var request = await http.get(uri, headers: headers);

    print("$path -> ${request.body}");

    if (request.statusCode == 400) {
      return jsonDecode(request.body);
    }

    if (request.statusCode != 200) {
      return null;
    }

    return jsonDecode(request.body);
  }




}