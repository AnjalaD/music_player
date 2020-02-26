// import 'package:flutter/material.dart';
// import 'package:flutter_audio_query/flutter_audio_query.dart';

// class EventHandler extends ChangeNotifier {
//   final FlutterAudioQuery audioQuery = FlutterAudioQuery();

//   List<SongInfo> _songs = [];
//   SongInfo _currentSong;
//   int _currentSongPosition;

//   List<SongInfo> get songs => _songs;

//   SongInfo get currentSong => _currentSong;

//   int get currentSongPosition => _currentSongPosition;

//   void getSongMetaData() async {
//     print('Fetching song data');
//     _songs = await audioQuery.getSongs();
//     if (_songs.isNotEmpty) {
//       _currentSong = _songs[0];
//       _currentSongPosition = 0;
//     } else {
//       _currentSong = null;
//       _currentSongPosition = null;
//     }
//     notifyListeners();
//   }

//   void changeSong(SongInfo song, int index) {
//     _currentSong = song;
//     _currentSongPosition = index;
//     print('current song: ' + _currentSong.title);
//     notifyListeners();
//   }

//   void nextSong() {
//     if (_currentSongPosition != null) {
//       if (_currentSongPosition == _songs.length - 1) {
//         _currentSong = _songs[0];
//         _currentSongPosition = 0;
//       } else {
//         _currentSongPosition++;
//         _currentSong = _songs[_currentSongPosition];
//       }
//       print('current song: ' + _currentSong.title);
//       notifyListeners();
//     }
//   }

//   void prevSong() {
//     if (_currentSongPosition != null) {
//       if (_currentSongPosition == 0) {
//         _currentSongPosition = _songs.length - 1;
//         _currentSong = _songs[_currentSongPosition];
//       } else {
//         _currentSongPosition--;
//         _currentSong = _songs[_currentSongPosition];
//       }
//       print('current song: ' + _currentSong.title);
//       notifyListeners();
//     }
//   }
// }
