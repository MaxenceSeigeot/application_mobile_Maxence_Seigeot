import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  Map<String, dynamic> _selectedGame = {};

  Map<String, dynamic> get selectedGame => _selectedGame;

  void setSelectedGame(Map<String, dynamic> data) {
    _selectedGame = data;
    notifyListeners();
  }
}
