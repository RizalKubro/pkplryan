import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:pet_shope/client_appwrite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  AuthHelper._privateConstructor();
  static final AuthHelper _instance = AuthHelper._privateConstructor();
  static AuthHelper get instance => _instance;

  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static final account = Account(client);


  Future<String?> getUserId() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('userId');
  }

  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isLoggedIn', value);
  }

loginEmailPassword(String email, String password) async {
  final SharedPreferences prefs = await _prefs;
  try {
    // Check if the user already has an active session
    final models.SessionList sessions = await account.listSessions();
    
    if (sessions.total > 0) {
      // If a session exists, use the active session instead of creating a new one
      prefs.setString('userId', sessions.sessions[0].userId);
      prefs.setString('email', email);
      prefs.setString('password', password);
      setLoggedIn(true);
      return true;
    } else {
      // If no active session, create a new session
      final models.Session response = await account.createEmailSession(
        email: email,
        password: password,
      );
      prefs.setString('userId', response.userId);
      prefs.setString('email', email);
      prefs.setString('password', password);
      setLoggedIn(true);
      return true;
    }
  } catch (e) {
    rethrow;
  }
}

  signUpEmailPassword(String email, String password) async {
    final SharedPreferences prefs = await _prefs;
    try {
      final user = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      final models.Session response = await account.createEmailSession(
        email: email,
        password: password,
      );
      prefs.setString('userId', response.userId);
      prefs.setString('email', email);
      prefs.setString('password', password);
      setLoggedIn(true);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('userId');
    prefs.remove('email');
    prefs.remove('password');
    setLoggedIn(false);
    account.deleteSessions();
  }

}