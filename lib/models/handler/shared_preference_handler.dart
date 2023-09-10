import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHandler {
  static final SharedPreferencesHandler _instance =
      SharedPreferencesHandler._internal();

  factory SharedPreferencesHandler() {
    return _instance;
  }

  SharedPreferencesHandler._internal();

  // Initialize SharedPreferences
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveEmailToPreferences(String email) async {
    await _prefs.setString('email', email);
  }

  Future<String?> getEmailFromPreferences() async {
    return _prefs.getString('email');
  }

  Future<void> deleteEmailFromPreferences() async {
    await _prefs.remove('email');
  }

  Future<bool> isUserLoggedIn() async {
    String? email = await getEmailFromPreferences();
    if (email != null && email.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}