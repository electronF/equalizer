// ignore_for_file: depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mapiol/res/api/models/message.dart';

class EndPoints {
  String user = "user";
  String botMessage = "botmessage";
  String asset = "asset";
  String search = "search";
  String organization = "organization";
}

class ApiService {
  String urlRoot = "kuichua.pythonanywhere.com/api";
  EndPoints endPoints = EndPoints();

  Future<Map<String, dynamic>> sendUserId(String userId) async {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("$urlRoot/${endPoints.user}"),
    );

    Map<String, String> headers = {"Content-Type": "application/json"};
    request.headers.addAll(headers);

    request.fields['user_id'] = userId;

    try {
      var response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        print(response.body);
        return {"success": false, "object": jsonDecode(response.body)};
      }
    } catch (e) {
      return {"success": false, "error": e};
    }
    return {"succes": false, "message": "Something append wrong in server"};
  }

  Future<Map<String, dynamic>> sendMessage(Message message) async {
    var request = http.MultipartRequest(
      "GET",
      Uri.parse("$urlRoot/${endPoints.botMessage}"),
    );

    Map<String, String> headers = {"Content-Type": "application/json"};
    request.headers.addAll(headers);

    Map<String, dynamic> dataObjet = message.toJson();

    request.fields['data'] = json.encode({
      'datatime': dataObjet['datetime'],
      'sender_id': dataObjet['sender_id'],
      'text': dataObjet['text']
    });

    try {
      var response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        return {"success": false, "object": jsonDecode(response.body)};
      }
    } catch (e) {
      return {"success": false, "error": e};
    }
    return {"succes": false, "message": "Something append wrong in server"};
  }

  Future<Map<String, dynamic>> getOrganizations() async {
    var request = http.MultipartRequest(
      "GET",
      Uri.parse("$urlRoot/${endPoints.organization}"),
    );

    Map<String, String> headers = {"Content-Type": "application/json"};
    request.headers.addAll(headers);

    try {
      var response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        print(response.body);
        return {"success": true, "object": jsonDecode(response.body)};
      }
    } catch (e) {
      return {"success": false, "error": e};
    }
    return {"succes": false, "message": "Something append wrong in server"};
  }

  Future<Map<String, dynamic>> getSearchResponses(String searchText) async {
    var request = http.MultipartRequest(
      "GET",
      Uri.parse("$urlRoot/${endPoints.search}"),
    );

    Map<String, String> headers = {"Content-Type": "application/json"};
    request.headers.addAll(headers);
    request.fields["Query"] = searchText;

    try {
      var response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        print(response.body);
        return {"success": true, "object": jsonDecode(response.body)};
      }
    } catch (e) {
      return {"success": false, "error": e};
    }
    return {"succes": false, "message": "Something append wrong in server"};
  }

  Future<Map<String, dynamic>> getAssets() async {
    var request = http.MultipartRequest(
      "GET",
      Uri.parse("$urlRoot/${endPoints.asset}"),
    );

    Map<String, String> headers = {"Content-Type": "application/json"};
    request.headers.addAll(headers);

    try {
      var response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        print(response.body);
        return {"success": true, "object": jsonDecode(response.body)};
      }
    } catch (e) {
      return {"success": false, "error": e};
    }
    return {"succes": false, "message": "Something append wrong in server"};
  }
}
