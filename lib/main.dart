import 'package:flutter/material.dart';
import 'package:music_player/logic/load_songs.dart';
import 'package:music_player/logic/player.dart';
import 'package:music_player/player.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SongLoader(),
        ),
        ChangeNotifierProvider(
          create: (_) => MusicPlayerCore(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MusicPlayer()),
    );
  }
}
