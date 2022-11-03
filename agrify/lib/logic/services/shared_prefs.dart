import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  setBoolean(bool val) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isEn', val);
  }

  Future<bool> get getLang async {
    final prefs = await SharedPreferences.getInstance();
    bool? isEnglish = await prefs.getBool('isEn');
    return isEnglish ?? false;
  }
}
