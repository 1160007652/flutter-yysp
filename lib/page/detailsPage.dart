import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:yysp/servers/httpUtil.dart';
import 'package:yysp/servers/Api.dart';
import 'package:yysp/model/video_detail.dart';


class DetailsPage extends StatefulWidget {
  final String videoId; // 路由携带的 播放id 参数

  DetailsPage(this.videoId);

  @override
  _DetailsPageState createState() => _DetailsPageState(this.videoId);
}

class _DetailsPageState extends State<DetailsPage> {
  final String _videoId;
  Video _videoInfo = new Video(0, '', '', '', '', '', '', '', '', '', 0, 0, '');
  VideoPlayerController _videoPlayController = new VideoPlayerController.network('');
  HttpUtil httpUtil = new HttpUtil();
  _DetailsPageState(this._videoId);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: AppBar(
              title: Text(
                "鹰眼视频",
                style: new TextStyle(fontSize: 20.0, letterSpacing: 3.0),
              ),
            ),
            body: Column(
              children: <Widget>[
                Container(
                  child: this._buildVideo()
                ),
                Text(_videoInfo.title)
              ],
            )
        )
    );
  }
  

  @override
  void initState() {
    super.initState();
    this._getVideoInfo();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayController.pause();
  }

  //获取网络数据 视频播放详情
  void _getVideoInfo() async {
    String url = Api.VideoInfo;
    var data = {'id': this._videoId};
    var response = await HttpUtil().get(url, data: data);
    VideoDetail videos = VideoDetail.fromJson(response);
    if (videos.code == 0) {
      _videoPlayController = VideoPlayerController.network( videos.data.video.src );
      setState(() {
        _videoInfo = new Video(videos.data.video.id, videos.data.video.title, videos.data.video.url, videos.data.video.auther, videos.data.video.pubtime, videos.data.video.img, videos.data.video.src, videos.data.video.desc1, videos.data.video.cate, videos.data.video.pt, videos.data.video.collect, videos.data.video.count, videos.data.video.insertTime);
      });
    }
  }

  // 视频
  Widget _buildVideo() {
    _videoPlayController.play();
    return new Chewie(
      _videoPlayController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
    );
  }
}
