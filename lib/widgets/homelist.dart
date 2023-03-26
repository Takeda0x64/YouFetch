import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youfetch/models/channel.dart';
import 'package:youfetch/screens/med.dart';
import 'package:youfetch/screens/videoplayer.dart';
import 'package:youfetch/util/uploaddatae.dart';
import 'package:youfetch/widgets/goto.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class HomeList extends StatefulWidget {
  HomeList({
    super.key,
    required this.videos,
    required this.channels,
  });
  late final List<dynamic> videos;
  late final List<dynamic> channels;

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    var videos = widget.videos;
    var channels = widget.channels;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        Video video = videos[index];
        Channel channel = channels[index];

        return InkWell(
          onTap: () {
            if (Platform.isAndroid || Platform.isIOS) {
              goto(context, VideoPlayer(video: video));
            } else {
              goto(context, CrossVideoPlayer(url: video.url));
              // launchUrlString(video.url,mode: LaunchMode.inAppWebView);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 250,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(video.thumbnails.highResUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(channel.logoUrl),
                    ),
                  ),
                ),
                title: Text(
                  video.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Container(
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Text(
                    "${video.author}  |  ${video.engagement.viewCount} Views  |  ${getTimeAgo(video.uploadDate!)}",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

   // Container(
              //   margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
              //   child: CircleAvatar(
              //     radius: 20, // size of the circle
              //     backgroundImage:
              //         NetworkImage(""), // image source
              //   ),
              // ),
 // Container(
              //   margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text(
              //         video.title,
              //           maxLines: 2,
              //             overflow: TextOverflow.ellipsis,
              //         style: const TextStyle(
              //           fontSize: 18.0,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       const SizedBox(height: 10.0),
              //       Row(
              //         children: [
              //           Text(
              //             video.channelTitle,
              //             maxLines: 2,
              //             overflow: TextOverflow.ellipsis,
              //           ),
              //           const SizedBox(width: 5.0),
              //           const Text(
              //             "|",
              //           ),
              //           const SizedBox(width: 5.0),
              //           Text(
              //             "${video.id.toString()} Views",
              //             maxLines: 2,
              //             overflow: TextOverflow.ellipsis,
              //           ),
              //           const SizedBox(width: 5.0),
              //           const Text(
              //             "|",
              //           ),
              //           const SizedBox(width: 5.0),
              //           Text(
              //             getTimeAgo(DateTime.parse(video.publishedAt!)),
              //             maxLines: 2,
              //             overflow: TextOverflow.ellipsis,
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),