import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/logic/player.dart';
import 'package:music_player/util/helpers.dart';
import 'package:provider/provider.dart';

class SongQueueTile extends StatelessWidget {
  final SongInfo songInfo;
  final int index;

  const SongQueueTile({Key key, this.songInfo, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MusicPlayerCore player = Provider.of<MusicPlayerCore>(context);
    final bool isSelected = player.currentSongPosition == index;

    return Dismissible(
      background: Container(color: Colors.red),
      key: Key(songInfo.toString()),
      onDismissed: (direction) {
        player.removeFromQueue(index);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Song Removed from Queue!")));
      },
      child: ListTile(
        dense: true,
        title: Text(songInfo.title),
        subtitle: Text(songInfo.artist),
        onTap: () => player.playNow(index),
        leading: Container(
          child: Helper.getAlbumArt(songInfo),
          height: 40.00,
        ),
        trailing: isSelected ? Icon(Icons.music_note) : null,
        selected: isSelected,
      ),
    );
  }
}
