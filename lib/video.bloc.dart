import 'package:rxdart/rxdart.dart';
import 'package:social_video_app/rest/pinkvillaModel.dart';
import 'package:social_video_app/video_manager.dart';
import 'package:social_video_app/rest/videos_api.dart';


class VideosBloc {
  final VideoAPI _videosAPI;
  VideoManager videoManager;

  VideosBloc(this._videosAPI) {
    videoManager = VideoManager(stream: this.listVideosEvent);
    loadVideos();
  }


  // ignore: close_sinks
  final BehaviorSubject<List<Pinkdata>> _listVideosController =
      new BehaviorSubject<List<Pinkdata>>.seeded(List<Pinkdata>());

  Stream<List<Pinkdata>> get listVideos => _listVideosController.stream;

  Sink<List<Pinkdata>> get listVideosEvent => _listVideosController.sink;

  List<Pinkdata> get videoList => videoManager.listVideos;

  loadVideos() async {
    var _membersAPI = await _videosAPI.getlistFromPinkvilla();
    videoManager.listVideos = _membersAPI.data;
    await videoManager.loadVideo(0);
    videoManager.playVideo(0);
  }
}
