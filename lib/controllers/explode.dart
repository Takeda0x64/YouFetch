import 'package:youfetch/util/console.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YTExplode {
  static var yt = YoutubeExplode();

  static Future<List<Video>> search(String query) async {
    return await yt.search(query);
  }

  static Future<List<Channel>> getVideoChannels(
      Future<List<dynamic>> videolist) async {
    List<Channel> channelsList = [];

    var vlist= await videolist;

    for (Video video in vlist) {
      channelsList.add(await yt.channels.get(video.channelId));
    }

    return channelsList;
  }
}
