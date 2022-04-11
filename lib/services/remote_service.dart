import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../model/post.dart';
import 'package:http/http.dart' as http;

class RemoteService
{
  Future<List<Post>?> getPosts() async{
    var client = http.Client();
    
    var uri = Uri.parse('https://estate-alarm.herokuapp.com/api/announcement/?format=json');
    var responce = await client.get(uri);
    if (responce.statusCode == 200){
      var json = jsonDecode(utf8.decode(responce.bodyBytes));
       return postFromJson(json);
    }
  }
}