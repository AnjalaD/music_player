import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class SongLoader extends ChangeNotifier {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  SongLoader() {
    _getSongMetaData();
  }

  List<SongInfo> _songs = [];

  List<SongInfo> get songs => _songs;

  void _getSongMetaData() async {
    print('Fetching song data');
    _songs = await audioQuery.getSongs();
    notifyListeners();
  }
}
