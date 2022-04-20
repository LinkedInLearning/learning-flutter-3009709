import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginUser(String userName) async {
    try {
      SharedPreferences sharedPrefs = await _prefs;
      sharedPrefs.setString('userName', userName);
    } catch (e) {
      print(e);
    }
  }

  void logoutUser() async {
    SharedPreferences sharedPrefs = await _prefs;
    sharedPrefs.clear();
  }

  Future<String?> getUserName() async {
    SharedPreferences sharedPrefs = await _prefs;
    return sharedPrefs.getString('userName') ?? 'DefaultValue';
  }
}
