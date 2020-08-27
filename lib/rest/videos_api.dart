import 'package:social_video_app/rest/pinkvillaModel.dart';
class VideosAPI {
    VideosAPI();
  var videoList = <Pinkdata>[];
  Future<List<Pinkdata>> listFrmJson(List<dynamic> json) async {
        return videoList == null ? new List<Pinkdata>() : json.map((
        value) => new Pinkdata.fromJson(value)).toList();

  }
}