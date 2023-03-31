// ignore_for_file: depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mapiol/res/api/models/message.dart';

class EndPoints {
  String botMessage = "botmessage";
  String asset = "asset";
  String search = "search";
  String organization = "organization";
}

class ApiService {
  String urlRoot = "10.0.2.2:8888/api/";
  EndPoints endPoints = EndPoints();

  Future<Map<String, dynamic>> sendMessage(Message message) async {
    var request = http.MultipartRequest(
      "GET",
      Uri.parse("$urlRoot/${endPoints.botMessage}"),
    );

    Map<String, String> headers = {"Content-Type": "application/json"};
    request.headers.addAll(headers);

    Map<String, dynamic> dataObjet = message.toJson();

    for (String key in ["DateTime", "SenderId", "Text"]) {
      request.fields[key] = dataObjet[key];
    }

    var response = await http.Response.fromStream(await request.send());
    try {
      if (response.statusCode == 200) {
        print(response.body);
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

    var response = await http.Response.fromStream(await request.send());
    try {
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

    var response = await http.Response.fromStream(await request.send());
    try {
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

    var response = await http.Response.fromStream(await request.send());
    try {
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
