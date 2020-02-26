import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class MusicPlayerCore extends ChangeNotifier {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  List<SongInfo> _songs = [];
  SongInfo _currentSong;
  int _currentSongPosition;
  AudioPlayer audioPlayer = AudioPlayer(playerId: 'qwyebk2bhe1ky2');

  List<SongInfo> get queue => _songs;

  SongInfo get currentSong => _currentSong;

  int get currentSongPosition => _currentSongPosition;

  void _play(SongInfo songInfo) {
    audioPlayer.stop();
    audioPlayer.play(songInfo.filePath);
  }

  void _setCurrentSong(int index) {
    _currentSong = _songs[index];
    _currentSongPosition = index;
    _play(_currentSong);
  }

  void ToggleShuffel() {
    if (_songs.length > 0) {
      _songs.shuffle();
      _setCurrentSong(0);
      notifyListeners();
    }
  }

  void play() {
    print('Play button pressed!');
    switch (audioPlayer.state) {
      case AudioPlayerState.PLAYING:
        audioPlayer.pause();
        notifyListeners();
        break;
      case AudioPlayerState.PAUSED:
        audioPlayer.resume();
        break;
      default:
        if (_currentSong != null) {
          audioPlayer.play(_currentSong.filePath);
        } else if (_songs.isNotEmpty) {
          _setCurrentSong(0);
        }
        break;
    }
    print(audioPlayer.state);
  }

  void playNow(int index) {
    _currentSong = _songs[index];
    _currentSongPosition = index;
    _play(_currentSong);
    notifyListeners();
  }

  void removeFromQueue(int index) {
    _songs.removeAt(index);

    if (index == _currentSongPosition) {
      nextSong();
    } else if (index < _currentSongPosition) {
      _currentSongPosition--;
    }
    notifyListeners();
  }

  void addToQueue(SongInfo songInfo) {
    print('New song added to the queue..');
    _songs.add(songInfo);
  }

  void addListToQueue(List<SongInfo> songs) {
    print('New songs added to the queue..');
    _songs.addAll(songs);
  }

  void changeSong(SongInfo song, int index) {
    _currentSong = song;
    _currentSongPosition = index;
    print('current song: ' + _currentSong.title);
    notifyListeners();
  }

  void nextSong() {
    if (_currentSongPosition != null) {
      if (_currentSongPosition >= _songs.length - 1) {
        _currentSong = _songs[0];
        _currentSongPosition = 0;
      } else {
        _currentSongPosition++;
        _currentSong = _songs[_currentSongPosition];
      }

      _play(_currentSong);
      print('current song: ' + _currentSong.title);
      notifyListeners();
    }
  }

  void prevSong() {
    if (_currentSongPosition != null) {
      if (_currentSongPosition == 0) {
        _currentSongPosition = _songs.length - 1;
        _currentSong = _songs[_currentSongPosition];
      } else {
        _currentSongPosition--;
        _currentSong = _songs[_currentSongPosition];
      }
      _play(currentSong);
      print('current song: ' + _currentSong.title);
      notifyListeners();
    }
  }
}
