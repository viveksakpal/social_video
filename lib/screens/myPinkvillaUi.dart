import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:social_video_app/rest/networkHelper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:social_video_app/rest/pinkvillaModel.dart';
import 'package:social_video_app/rest/networkResult.dart';

class MyPinkvillaUi extends StatefulWidget {
  @override
  createState() => MyPinkvillaUiState();
}

class MyPinkvillaUiState extends State<MyPinkvillaUi> {
  var _members = List<Pinkdata>();

  // final _biggerFont = const TextStyle(fontSize: 18.0);
  // final _smallerFont = const TextStyle(fontSize: 12.0);
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        dismissible: true,
        child: ListView.builder(
            itemCount: _members.length,
            itemBuilder: (BuildContext context, int pos) {
              
                            return _buildPrintResult(pos, _members);
            }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    wrappedAPICall();
  }

  Widget _buildPrintResult(int pos, List<Pinkdata> member) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${member[pos].url}"),
              Text("${member[pos].commentCount}"),
              Text("${member[pos].likeCount}"),
              Text("${member[pos].shareCount}"),
              Text("${member[pos].title}"),
            ],
          ),
        ));
  }

  void wrappedAPICall() async {
    var _membersAPI = await getRemotePinkvillaList();

    setState(() {
      _members = _membersAPI.data;
      _loading = false;
    });
  }

  Future<NetworkResult<List<Pinkdata>>> getRemotePinkvillaList() async {
    NetworkHelper networkHelper = NetworkHelper();

    final response = await networkHelper
        .get<String>('https://www.pinkvilla.com/feed/video-test/video-feed.json');
    return NetworkResult<List<Pinkdata>>.handleRes(response, (String result) {
//      final data = MyFriends.fromJson(json.decode(result)) as List;
      final data = json.decode(result);
      final dataAsList = data as List;
     // final dataAsList = data["employee"] as List;

      return Pinkdata.listFrmJson(dataAsList);
    });
  }
}
