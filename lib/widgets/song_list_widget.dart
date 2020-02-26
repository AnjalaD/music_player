import 'package:flutter/material.dart';
import 'package:music_player/logic/load_songs.dart';
import 'package:music_player/widgets/song_list_tile_widget.dart';
import 'package:provider/provider.dart';

class SongListWidget extends StatefulWidget {
  SongListWidget({Key key}) : super(key: key);

  @override
  _SongListWidgetState createState() => _SongListWidgetState();
}

class _SongListWidgetState extends State<SongListWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SongLoader>(
      builder: (context, eventHandler, _) => ListView.builder(
        itemCount: eventHandler.songs.length,
        itemBuilder: (_, index) =>
            SongListTile(songInfo: eventHandler.songs[index]),
      ),
    );
  }
}
