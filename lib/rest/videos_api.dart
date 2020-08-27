import 'dart:convert';
import 'package:social_video_app/rest/pinkvillaModel.dart';
import 'package:social_video_app/rest/networkHelper.dart';
import 'package:social_video_app/rest/networkResult.dart';

// this is videoapi repo for providing data for bloc consumption

class VideoAPI {
  VideoAPI();
  Future<NetworkResult<List<Pinkdata>>> getlistFromPinkvilla() async {
    NetworkHelper networkHelper = NetworkHelper();

    final response = await networkHelper.get<String>(
        'https://www.pinkvilla.com/feed/video-test/video-feed.json');
    return NetworkResult<List<Pinkdata>>.handleRes(response, (String result) {
//      final data = MyFriends.fromJson(json.decode(result)) as List;
      final data = json.decode(result);
      final dataAsList = data as List;
      // final dataAsList = data["employee"] as List;

      return Pinkdata.listFrmJson(dataAsList);
    });
  }
}
