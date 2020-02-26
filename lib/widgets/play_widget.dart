import 'package:flutter/material.dart';
import 'package:music_player/logic/player.dart';
import 'package:music_player/util/helpers.dart';
import 'package:music_player/widgets/play_button_widget.dart';
import 'package:music_player/widgets/time_slider.dart';
import 'package:provider/provider.dart';

class PlayerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MusicPlayerCore player = Provider.of<MusicPlayerCore>(context);

    return Column(
      children: <Widget>[
        Text(
          player.currentSong != null
              ? player.currentSong.title
              : 'No song selected',
        ),
        Container(
          height: 100.00,
          child: Helper.getAlbumArt(player.currentSong),
        ),
        TimeSlider(
          audioPlayer: player.audioPlayer,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 64.0,
              onPressed: player.prevSong,
            ),
            PlayButton(
              audioPlayer: player.audioPlayer,
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              iconSize: 64.0,
              onPressed: player.nextSong,
            )
          ],
        ),
      ],
    );
  }
}
