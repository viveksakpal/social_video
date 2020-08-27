import 'package:rxdart/rxdart.dart';
import 'package:social_video_app/rest/pinkvillaModel.dart';
import 'package:social_video_app/video_manager.dart';
import 'package:social_video_app/rest/videos_api.dart';

// class VideosBloc {
//   final VideosAPI _videosAPI;
//   VideoManager videoManager;

//   VideosBloc(this._videosAPI) {
//     videoManager = VideoManager(stream: this.listVideosEvent);
//     loadVideos();
//   }

//   final BehaviorSubject<List<Pinkdata>> _listVideosController =
//       new BehaviorSubject<List<Pinkdata>>.seeded(List<Pinkdata>());

//   Stream<List<Pinkdata>> get listVideos => _listVideosController.stream;

//   Sink<List<Pinkdata>> get listVideosEvent => _listVideosController.sink;

//   //List<Pinkdata> get videoList => videoManager.listVideos;

//   loadVideos() async {
//     videoManager.listVideos = await Pinkdata.listFrmJson(dataAsList);
//     await videoManager.loadVideo(0);
//     videoManager.playVideo(0);

//     //listVideosEvent.add(_videoList);
//   }
// }

class VideosBloc{

  final VideosAPI _videosAPI;
  VideoManager videoManager;

  VideosBloc(this._videosAPI){
    videoManager = VideoManager(stream:this.listVideosEvent);
    loadVideos();
  }
  
  // ignore: close_sinks
  final BehaviorSubject<List<Pinkdata>> _listVideosController =
      new BehaviorSubject<List<Pinkdata>>.seeded(List<Pinkdata>());

  Stream<List<Pinkdata>> get listVideos =>
      _listVideosController.stream;

  Sink<List<Pinkdata>> get listVideosEvent => _listVideosController.sink;

  List<Pinkdata> get videoList => videoManager.listVideos;

  loadVideos() async{
    videoManager.listVideos = await _videosAPI.listFrmJson(videoList); 
    await videoManager.loadVideo(0);
    videoManager.playVideo(0);

    //listVideosEvent.add(_videoList);
  }

}
