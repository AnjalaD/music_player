import 'package:flutter/material.dart';
import 'package:music_player/widgets/song_list_widget.dart';

class AllSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Songs'),
      ),
      body: SongListWidget(),
    );
  }
}
