import 'package:json_annotation/json_annotation.dart';
import 'package:cached_video_player/cached_video_player.dart';

//this Pinkdata model is used to parse rest api to local objects and 
//video player implementation
class Pinkdata {
  String url;
  @JsonKey(name:'comment-count')
  int commentCount;
  @JsonKey(name:'like-count')
  int likeCount;
  @JsonKey(name:'share-count')
  int shareCount;
  String title;
  User user;

  CachedVideoPlayerController controller;

  Pinkdata(
      {this.url,
      this.commentCount,
      this.likeCount,
      this.shareCount,
      this.title,
      this.user});

  Pinkdata.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    commentCount = json['comment-count'];
    likeCount = json['like-count'];
    shareCount = json['share-count'];
    title = json['title'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['comment-count'] = this.commentCount;
    data['like-count'] = this.likeCount;
    data['share-count'] = this.shareCount;
    data['title'] = this.title;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }

 static List<Pinkdata> listFrmJson(List<dynamic> json) {
    return json == null ? new List<Pinkdata>() : json.map((
        value) => new Pinkdata.fromJson(value)).toList();
  }
 setupVideo(){
    controller = CachedVideoPlayerController.network(url)
    ..initialize().then((_) {
      controller.setLooping(true);
    });
  }

}

class User {
  String name;
  String headshot;

  User({this.name, this.headshot});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    headshot = json['headshot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['headshot'] = this.headshot;
    return data;
  }

  
}
