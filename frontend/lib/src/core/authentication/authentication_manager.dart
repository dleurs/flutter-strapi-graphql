import 'package:frontend/src/core/storage_manager.dart';
import 'package:frontend/src/models/authentication/token.dart';

class AuthenticationManager {
  AuthenticationManager._privateConstructor();

  static final AuthenticationManager _instance =
      AuthenticationManager._privateConstructor();

  static AuthenticationManager get instance => _instance;

  static const String _AUTH_KEY = "numberly.starter.authentication";

  static const String IS_LOGGED_IN = "isLoggedIn";

  static const String LOGIN = "login";

  static const String PASSWORD = "password";

  static const String TOKEN = "token";

  static const String USER_ID = "userId";

  static void load() async {
    await _instance._load();
  }

  final StorageManager _storageManager = StorageManager(_AUTH_KEY);

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
  }

  Future<void> doLogin(String login, String password, Token token) async {
    _isLoggedIn = true;
    _login = login;
    _password = password;
    _token = token;
    await _save();
  }

  Future<void> saveUserId(String userId) async {
    _userId = userId;
    await _save();
  }

  Future<void> updateCredentials(
      {String login, String password, Token token}) async {
    if (login != null) {
      _login = login;
    }

    if (password != null) {
      _password = password;
    }

    if (token != null) {
      _token = token;
    }

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
