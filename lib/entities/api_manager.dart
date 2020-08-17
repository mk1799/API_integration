import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iroid/entities/post.dart';

class API_Manager{
  Future<Post> getPost() async{
    var client = http.Client();
    var post;
    try{
      var response = await client.get('https://www.iroidsolutions.com/interview/test.json');
      if (response.statusCode == 200) {
        var jsonMap = json.decode(response.body);

        post = Post.fromJson(jsonMap);
    }
    }
    catch(Exception){
      return post;
    }
    return post;
  }
}