import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceProvider with ChangeNotifier {
  late SharedPreferences _preferences;

  SharedPreferences get pref => _preferences;

  bool _isBoardingCompleted = false;

  bool get isBoardingCompleted => _isBoardingCompleted;

  Future<void> loadBoardingStatus() async {
    _preferences = await SharedPreferences.getInstance();
    _isBoardingCompleted = pref.getBool('boardingCompleted') ?? false;
    notifyListeners();
  }

  Future<void> completeBoarding() async {
    _isBoardingCompleted = true;
    _preferences = await SharedPreferences.getInstance();
    await pref.setBool('boardingCompleted', true);
    notifyListeners();
  }

  SharePreferenceProvider() {
    loadBoardingStatus();
  }
}
