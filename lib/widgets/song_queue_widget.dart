import 'package:flutter/material.dart';
import 'package:music_player/logic/player.dart';
import 'package:music_player/widgets/song_queue_tile_widget.dart';
import 'package:provider/provider.dart';

class SongQueueWidget extends StatelessWidget {
  SongQueueWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlayerCore>(
      builder: (context, player, _) => ListView.builder(
        itemCount: player.queue.length,
        itemBuilder: (_, index) =>
            SongQueueTile(songInfo: player.queue[index], index: index),
      ),
    );
  }
}
