import 'package:flutter/material.dart';
import 'package:music_player/all_songs.dart';
import 'package:music_player/widgets/play_widget.dart';
import 'package:music_player/widgets/song_list_widget.dart';
import 'package:music_player/widgets/song_queue_widget.dart';

class MusicPlayer extends StatefulWidget {
  MusicPlayer({Key key}) : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Musix'),
      ),
      body: Column(
        children: <Widget>[
          PlayerWidget(),
          Expanded(
            child: SongQueueWidget(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.queue_music,
          size: 48.0,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AllSongs(),
            ),
          );
        },
      ),
    );
  }
}
