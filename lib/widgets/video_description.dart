import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  final username;
  final videtoTitle;
  final songInfo;

  VideoDescription(this.username, this.videtoTitle, this.songInfo);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          //height: 70.0,
            padding: EdgeInsets.only(left: 15.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      '@' + username,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(videtoTitle,maxLines: 2,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Row(children: [
                      Icon(
                        Icons.music_note,
                        size: 15.0,
                        color: Colors.white,
                      ),
                      Text(songInfo, style: TextStyle(fontSize: 12.0))
                    ]),
                  ),
                ])));
  }
}
