import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Helper {
  static Image getAlbumArt(SongInfo songInfo) {
    try {
      return Image.file(
        File(songInfo.albumArtwork),
        // fit: BoxFit.cover,
      );
    } catch (e) {
      return Image.asset(
        'music/default-logo.png',
        // fit: BoxFit.cover,
      );
    }
  }
}
