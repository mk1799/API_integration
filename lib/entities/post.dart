import 'dart:convert';

Post newsModelFromJson(String str) => Post.fromJson(json.decode(str));

String newsModelToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.post,
    this.name,
    this.email,
  });
  String name;
  String email;
  String  phone, id, company, gender;
  
  List<Post> post;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
        post:List<Post>.from(json[""].map((x)=>Post.fromJson(x))),
        name: json["name"],
        email: json["email"],);
  
  Map<String,dynamic> toJson()=>{
    "name":name,
    "email":email,
  };
}