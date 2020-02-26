import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/logic/player.dart';
import 'package:provider/provider.dart';

class PlayButton extends StatelessWidget {
  final AudioPlayer audioPlayer;

  PlayButton({Key key, this.audioPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AudioPlayerState>(
        stream: audioPlayer.onPlayerStateChanged,
        builder: (context, playerState) {
          return IconButton(
            icon: Icon(
              playerState.data == AudioPlayerState.PLAYING
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
            iconSize: 64.0,
            onPressed: () =>
                Provider.of<MusicPlayerCore>(context, listen: false).play(),
          );
        });
  }
}
