import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:social_video_app/screens/pinkvillaUi.dart';
import 'package:social_video_app/video.bloc.dart';
import 'package:social_video_app/rest/videos_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
         // Uncomment in phase 3 to apply white to text
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
