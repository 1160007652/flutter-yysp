import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:yysp/page/detailsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:yysp/servers/httpUtil.dart';
import 'package:yysp/servers/Api.dart';
import 'package:yysp/model/videos.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpUtil httpUtil = new HttpUtil();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  ScrollController _scrollController = ScrollController(); //listview的控制器
  List<dynamic> _videosList = new List(); // 视频列表数据
  var _pageNo = 0; // 开始页
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: AppBar(
              title: Text(
                "鹰眼视频",
                style: new TextStyle(fontSize: 20.0, letterSpacing: 3.0),
              ),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){
                  Navigator.of(context).pushNamed("/aboutPage");
                },
              ),
            ),
            body: new RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: this._handleRefeshVideos,
                child: new ListView.builder(
                  controller: _scrollController,
                  itemCount: _videosList.length,
                  physics: new AlwaysScrollableScrollPhysics(),
                  itemBuilder: this._buildRow,
                ))));
  }
  // 图片懒惰加载
  Widget _buildImage(String imgUrl) {
    return new FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: imgUrl,
      height: 200.0,
      fit: BoxFit.fitWidth,
      fadeInDuration: const Duration(milliseconds: 300),
      fadeOutDuration: const Duration(milliseconds: 300),
    );
  }
  
  Widget _buildRow(BuildContext context, int position) {
    print(_videosList[position].toString());
    return new Card(
      margin: EdgeInsets.only(bottom: 38.0),
      child: new Container(
        height: 260.0,
        child: Column(
          children: <Widget>[
            new GestureDetector(
              child:Container(
                width: double.infinity,
                height: 200.0,
                child: this._buildImage(_videosList[position]['img']),
              ),
              onTap: this._videoPlayToggle(_videosList[position]['id']),
            ),
            Container(
              height: 60.0,
              child: Center(
                child:Text(
                  _videosList[position]['auther'],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent
                  )
                )
              )
            )
          ],
        )
        // this._buildVideo(_videosList[position]['src']),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    _getNewsContent();
    // 监听滚动事件 实现上拉加载功能
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _getContent();
      }
    });
  }

  //获取网络数据 列表追加数据
  void _getContent() async {
    String url = Api.VideList;
    var data = {'id': this._videosList.last['id'], 'cate': '美女'};
    var response = await HttpUtil().get(url, data: data);
    Videos videos = Videos.fromJson(response);
    if (videos.code == 0) {
      setState(() {
        _videosList.addAll(videos.data.listData);
        _pageNo = this._pageNo + 1;
      });
    }
  }
  //获取网络数据 首屏数据
  void _getNewsContent() async {
    String url = Api.VideoNews;
    var data = {'cate': '美女'};
    var response = await HttpUtil().get(url, data: data);
    Videos videos = Videos.fromJson(response);
    if (videos.code == 0) {
      setState(() {
        _videosList=videos.data.listData;
        _pageNo = 1;
      });
    }
  }

  // 下啦刷新
  Future<Null> _handleRefeshVideos() async {
    _videosList.clear();
    setState(() {
      _pageNo = 0;
    });
    _getNewsContent();
    return null;
  }

  // 切换到播放页面
  Function _videoPlayToggle(id) {
    return () => Navigator.of(context).push(new PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return new DetailsPage(id.toString());
                        }));
  }
}
