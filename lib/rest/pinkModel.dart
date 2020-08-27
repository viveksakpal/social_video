// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// class Pinkdata extends Equatable {
//   final String url;
//   @JsonKey(name:'comment-count')
//   final int commentCount = 1;
//   @JsonKey(name:'like-count')
//   final int likeCount;
//   @JsonKey(name:'share-count')
//   final int shareCount;
//   final String title;
//   final User user;

//   const Pinkdata({
//     this.url,
//     this.commentCount,
//     this.likeCount,
//     this.shareCount,
//     this.title,
//     this.user
//   });

//   @override
//   List<Object> get props => [
//         url,
//         likeCount,
//         shareCount,
//         commentCount,
//         title,
//         user,
//       ];

//   Pinkdata.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     commentCount = json['comment-count'];
//     likeCount = json['like-count'];
//     shareCount = json['share-count'];
//     title = json['title'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }

//   // static WeatherCondition _mapStringToWeatherCondition(String input) {
//   //   WeatherCondition state;
//   //   switch (input) {
//   //     case 'sn':
//   //       state = WeatherCondition.snow;
//   //       break;
//   //     case 'sl':
//   //       state = WeatherCondition.sleet;
//   //       break;
//   //     case 'h':
//   //       state = WeatherCondition.hail;
//   //       break;
//   //     case 't':
//   //       state = WeatherCondition.thunderstorm;
//   //       break;
//   //     case 'hr':
//   //       state = WeatherCondition.heavyRain;
//   //       break;
//   //     case 'lr':
//   //       state = WeatherCondition.lightRain;
//   //       break;
//   //     case 's':
//   //       state = WeatherCondition.showers;
//   //       break;
//   //     case 'hc':
//   //       state = WeatherCondition.heavyCloud;
//   //       break;
//   //     case 'lc':
//   //       state = WeatherCondition.lightCloud;
//   //       break;
//   //     case 'c':
//   //       state = WeatherCondition.clear;
//   //       break;
//   //     default:
//   //       state = WeatherCondition.unknown;
//   //   }
//   //   return state;
//   // }
// }
// class User {
//    String name;
//    String headshot;

//   User({this.name, this.headshot});

//   User.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     headshot = json['headshot'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['headshot'] = this.headshot;
//     return data;
//   }

  
// }