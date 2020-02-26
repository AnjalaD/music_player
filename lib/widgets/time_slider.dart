import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/logic/player.dart';
import 'package:provider/provider.dart';

class TimeSlider extends StatelessWidget {
  final AudioPlayer audioPlayer;
  TimeSlider({Key key, this.audioPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MusicPlayerCore player = Provider.of<MusicPlayerCore>(context);
    final double duration = player.currentSong != null
        ? double.parse(player.currentSong.duration)
        : 1.0;

    return StreamBuilder<Duration>(
        stream: audioPlayer.onAudioPositionChanged,
        builder: (context, p) {
          double current = 0.0;
          if (p.hasData) {
            current = p.data.inMilliseconds.toDouble();
          }

          double value = current / duration;
          // print(value.toString() + " && " + duration.toString());

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(Duration(milliseconds: (value * duration).toInt())
                  .toString()
                  .substring(2, 7)),
              Slider(
                  value: value > 1.0 ? 0.0 : value,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (double val) => {
                        duration != 1.0
                            ? audioPlayer.seek(Duration(
                                milliseconds: (duration * val).toInt()))
                            : null
                      }),
              Text(
                Duration(milliseconds: duration.toInt())
                    .toString()
                    .substring(2, 7),
              ),
            ],
          );
        });
  }
}
