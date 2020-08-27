import 'package:flutter/material.dart';
import 'package:social_video_app/rest/pinkvillaModel.dart';
import 'package:social_video_app/rest/videos_api.dart';
import 'package:social_video_app/widgets/actions_toolbar.dart';
import 'package:social_video_app/widgets/video_description.dart';
import 'package:social_video_app/video.bloc.dart';
import 'package:cached_video_player/cached_video_player.dart';

//this is main Screen for this app

class PinkvillaMain extends StatefulWidget {
  PinkvillaMain({Key key}) : super(key: key);

  @override
  _PinkvillaMainState createState() => _PinkvillaMainState();
}

class _PinkvillaMainState extends State<PinkvillaMain> {
    var _members = List<Pinkdata>();
   // bool _loading = true;
   Stream<List<Pinkdata>> listVideos;
   VideosBloc _videosBloc;

  @override
  void initState() {
    super.initState();
    _videosBloc = VideosBloc(VideoAPI());
     listVideos = _videosBloc.listVideos;
  }

  // Widget get topSection => Container(
  //     height: 100.0,
  //     padding: EdgeInsets.only(bottom: 15.0),
  //     alignment: Alignment(0.0, 1.0),
  //     child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Text('Following'),
  //           Container(
  //             width: 15.0,
  //           ),
  //           Text('For you',
  //               style: TextStyle(
  //                   fontSize: 17.0, fontWeight: FontWeight.bold))
  //         ]),
  //   );

  Widget videoViewer(){

    return Container(
     child: Center(
        child: StreamBuilder(
          initialData: List<Pinkdata>(),
          stream: listVideos,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();  
            List<Pinkdata> videos = snapshot.data;
            if(videos.length > 0){
            return PageView.builder(
              controller: PageController(
                initialPage: 0,
                viewportFraction: 1,
              ),
              onPageChanged: (index){
                index = index % (videos.length);
                _videosBloc.videoManager.changeVideo(index);
              },
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index){
                index = index % (videos.length);
                return videoCard(_videosBloc.videoManager.listVideos[index]);
              },
            );
          }else{
            return CircularProgressIndicator();
          }
        }
      )
    ));
  }

  Widget videoCard(Pinkdata video){
    var controller = video.controller;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[ 
        controller != null && controller.value.initialized ? 
        GestureDetector(
          onTap: () {
              controller.value.isPlaying
                ? controller.pause()
                : controller.play();
          },
          child:
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: controller.value.size?.width ?? 0,
                  height: controller.value.size?.height ?? 0,
                  child: CachedVideoPlayer(controller),
                ),
              )
            )
        ) : Column(mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
          LinearProgressIndicator()
        ],),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
               VideoDescription(video.user.name.toString(),video.title.toString(),'Song Title'),
               ActionsToolbar(video.likeCount.toString(),video.commentCount.toString(),video.user.headshot,video.shareCount.toString()),
              ],
          )
        ],)
      ],
    );
  }

  Widget get middleSection => Expanded(
    child: videoViewer());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: 
        Stack(children: <Widget>[
            Column(
              children: <Widget>[
                middleSection,
              ],
            ),
        ]
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}