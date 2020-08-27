import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:social_video_app/screens/myPinkvillaUi.dart';
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

// class HomePage extends StatefulWidget {
//   HomePage({Key key, this.title}) : super(key: key);
//   final String title;
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final title = 'Flutter Demos';
//   @override
//   Widget build(BuildContext context) {
//       return MaterialApp(
//       title: title,
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(title),
//           ),
//           bottomNavigationBar: new TabBar(
//             tabs: [
//               Tab(
//                 icon: new Icon(Icons.home),
//               ),
//               Tab(
//                 icon: new Icon(Icons.rss_feed),
//               ),
//               Tab(
//                 icon: new Icon(Icons.perm_identity),
//               )
//             ],
//             labelColor: Colors.yellow,
//             unselectedLabelColor: Colors.blue,
//             indicatorSize: TabBarIndicatorSize.label,
//             indicatorColor: Colors.red,
//           ),
//           body: TabBarView(
//             children: [
//               new Container(
//                 color: Colors.yellow,
//                 child: PinkvillaMain(),
//               ),
//               // Replace with main screen
//               new Container(
//                 color: Colors.orange,
                
//               ),
//               new Container(
//                 color: Colors.lightGreen,
//                 //child: PinkvillaMain(),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

