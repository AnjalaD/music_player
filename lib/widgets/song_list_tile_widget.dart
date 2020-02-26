import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/logic/player.dart';
import 'package:music_player/util/helpers.dart';
import 'package:provider/provider.dart';

class SongListTile extends StatelessWidget {
  final SongInfo songInfo;

  const SongListTile({Key key, this.songInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MusicPlayerCore player = Provider.of<MusicPlayerCore>(context);
    final bool isSelected = player.currentSong != null &&
        player.currentSong.filePath == songInfo.filePath;

    return ListTile(
      dense: true,
      title: Text(songInfo.title),
      subtitle: Text(songInfo.artist),
      onTap: () => player.addToQueue(songInfo),
      leading: Container(
        child: Helper.getAlbumArt(songInfo),
        height: 40.00,
      ),
      trailing: isSelected ? Icon(Icons.music_note) : null,
      selected: isSelected,
    );
  }
}
