import 'package:http/http.dart' as http;
import 'package:testapp/model/url_model.dart';
import 'dart:convert';
import '../model/photo_model.dart';

class PhotoApi{
  static Future<List<PhotoModel>> fetchUsers () async {
    const url = 'https://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';
    final uri = Uri.parse(url);
    final respounse = await http.get(uri);
    final body = respounse.body;
    final json = jsonDecode(body);
    final results = json['results'] as List <dynamic>;
    final photoModels = results.map((e) {
      return PhotoModel(
        username: e['username'],
        description: e['description'],
        urls: e['urls'],

      );
    }).toList();
return photoModels;

  }
}