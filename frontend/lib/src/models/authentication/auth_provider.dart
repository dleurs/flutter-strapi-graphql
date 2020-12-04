import 'package:flutter/material.dart';
import 'package:frontend/src/core/storage_manager.dart';
import 'package:frontend/src/models/authentication/token.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn;
  bool get isLoggedIn => _isLoggedIn;

  String _login;
  String get login => _login;

  String _password;
  String get password => _password;

  Token _token;
  Token get token => _token;

  String _userId;
  String get userId => _userId;

  final StorageManager _storageManager = StorageManager(_AUTH_KEY);

  static const String _AUTH_KEY = "frontend.authentication";
  static const String IS_LOGGED_IN = "isLoggedIn";
  static const String LOGIN = "login";
  static const String PASSWORD = "password";
  static const String TOKEN = "token";
  static const String USER_ID = "userId";

  Future<void> _load() async {
    await _storageManager.open();
    _isLoggedIn = _storageManager.getBoolean(IS_LOGGED_IN, defaultValue: false);
    _login = _storageManager.getString(LOGIN);
    _password = await _storageManager.getSecureString(PASSWORD);
    _userId = _storageManager.getString(USER_ID);
    var tokenJson = _storageManager.getJson(TOKEN);
    if (tokenJson != null) {
      _token = Token.fromJson(tokenJson);
    }
    notifyListeners();
  }

  Future<void> doLogin(String login, String password, Token token) async {
    _isLoggedIn = true;
    _login = login;
    _password = password;
    _token = token;
    notifyListeners();
    await _save();
  }

  Future<void> doLogout() async {
    _isLoggedIn = false;
    _login = null;
    _password = null;
    _token = null;
    _userId = null;
    await _save();
  }

  Future<void> _save() async {
    await _storageManager.open();
    await _storageManager.setString(LOGIN, _login);
    await _storageManager.setSecureString(PASSWORD, _password);
    await _storageManager.setBoolean(IS_LOGGED_IN, _isLoggedIn);
    await _storageManager.setString(USER_ID, _userId);
    await _storageManager.setJson(TOKEN, _token);
  }

  Future<void> clear() async {
    await _storageManager.open();
    await _storageManager.clear();
  }
}
