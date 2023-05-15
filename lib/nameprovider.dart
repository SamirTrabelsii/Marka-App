import 'package:flutter/material.dart';

class NameProvider extends ChangeNotifier {
  String _playername1 = "";
  String _playername2 = "";
  String _playername3 = "";
  String _playername4 = "";
  int TeamAscore = 0;
  int TeamBscore = 0;
  int Tar7A = 0;
  int Tar7B = 0;

  String get getName1 => _playername1;
  String get getName2 => _playername2;
  String get getName3 => _playername3;
  String get getName4 => _playername4;
  int get getScoreA => TeamAscore;
  int get getScoreB => TeamBscore;
  int get getTar7A => Tar7A;
  int get getTar7B => Tar7B;

  saveName1(String name) {
    _playername1 = name;
    notifyListeners();
  }

  saveName2(String name) {
    _playername2 = name;
    notifyListeners();
  }

  saveName3(String name) {
    _playername3 = name;
    notifyListeners();
  }

  saveName4(String name) {
    _playername4 = name;
    notifyListeners();
  }

  saveScoreA(int Score) {
    TeamAscore = Score;
    notifyListeners();
  }

  saveScoreB(int Score) {
    TeamBscore = Score;
    notifyListeners();
  }

  savetar7A(int Score) {
    Tar7A = Score;
    notifyListeners();
  }

  savetar7B(int Score) {
    Tar7B = Score;
    notifyListeners();
  }
}
