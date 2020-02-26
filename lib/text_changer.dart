import 'package:flutter/material.dart';

class TextChanger extends ChangeNotifier {
  String _text = '';

  void setText(String s) {
    _text = s;
    notifyListeners();
  }

  String getText() => _text;
}
