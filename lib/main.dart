import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:social_video_app/screens/pinkvillaUi.dart';
import 'package:social_video_app/video.bloc.dart';
import 'package:social_video_app/rest/videos_api.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return BlocProvider(
      blocs: [
        Bloc((i) => VideosBloc(VideoAPI())),
      ],
      child: 
     MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
        ),
      ),
      home: PinkvillaMain(),
    )
    );
  }
}
