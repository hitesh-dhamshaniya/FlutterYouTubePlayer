import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String videoURL = "https://www.youtube.com/watch?v=vVQp_yXtH7E";
  YoutubePlayerController mYoutubePlayerController;

  @override
  void initState() {
    super.initState();
    mYoutubePlayerController =
        YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(videoURL), flags: const YoutubePlayerFlags(autoPlay: true, mute: false));
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: mYoutubePlayerController),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Youtube Video Player"),
          ),
          body: Container(
            child: player,
          ),
        );
      },
    );
  }
}
