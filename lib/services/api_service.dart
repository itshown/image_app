import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'dart:io';

import 'package:image_app/config/api_constants.dart';
import 'package:image_app/models/response_model.dart';

class ApiService {
  final String _baseUrl = APIConstants.baseUrl;
  final String _token = APIConstants.token;

  ApiService();

  Future<ResponseModel> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {
        "content-type": "application/json",
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return ResponseModel(status: true, data: body);
    } else {
      return ResponseModel(status: false, data: response.reasonPhrase);
    }
  }

  Future<ResponseModel> post(String endpoint, body) async {
    final response = await http.post(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {
        "content-type": "application/json",
        'Authorization': 'Bearer $_token',
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return ResponseModel(status: true, data: body);
    } else {
      return ResponseModel(status: false, data: response.reasonPhrase);
    }
  }

  Future<ResponseModel> upload(String endpoint, {required File image, required String key}) async {
    var headers = {
      'Authorization': 'Bearer $_token',
      'Content-Type': 'multipart/form-data',
    };
    var imgName = image.path.split("/").last;
    final Uri uri = Uri.parse('$_baseUrl$endpoint');
    var request = http.MultipartRequest('POST', uri);

    request.files.add(http.MultipartFile(
      key,
      image.readAsBytes().asStream(),
      image.lengthSync(),
      filename: imgName,
      contentType: MediaType("image", imgName.split(".").last),
    ));
    request.headers.addAll(headers);

    http.Response response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return ResponseModel(status: true, data: body);
    }
    else {
      debugPrint(response.reasonPhrase);
      return ResponseModel(status: false, data: response.reasonPhrase);
    }

  }
}
