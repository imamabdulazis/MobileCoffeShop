import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferencesManager _instance;
  static SharedPreferences _preferences;

  //? save data
  static const String keyAccessToken = 'accessToken';
  static const String keyLoggedStatus = "isLoggedIn";
  static const String keyAccessType = "accessType";
  static const String keyTeacherStatus = "accessTeacher";
  static const String keyIdUser = "idUser";
  static const String keyIdStudent = "idStudent";
  static const String keyIdTeacher = "idTeacher";
  static const String keyIdPhone = "imei";
  static const String keyIdClassroom = "idClassroom";

  //NOTE : setting notification
  static const String keySoundPersonal = "keySoundPersonal";
  static const String keySoundGroup = "keySoundGroup";
  static const String keySoundSubject = "keySoundSubject";
  static const String keySoundQuiz = "keySoundQuiz";
  static const String keySoundTask = "keySoundTask";
  static const String keySoundExam = "keySoundExam";

  //? function
  static Future<SharedPreferencesManager> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesManager();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  Future<bool> putBool(String key, bool value) =>
      _preferences.setBool(key, value);

  bool getBool(String key) => _preferences.getBool(key);

  Future<bool> putDouble(String key, double value) =>
      _preferences.setDouble(key, value);

  double getDouble(String key) => _preferences.getDouble(key);

  Future<bool> putInt(String key, int value) => _preferences.setInt(key, value);

  int getInt(String key) => _preferences.getInt(key);

  Future<bool> putString(String key, String value) =>
      _preferences.setString(key, value);

  String getString(String key) => _preferences.getString(key);

  Future<bool> putStringList(String key, List<String> value) =>
      _preferences.setStringList(key, value);

  List<String> getStringList(String key) => _preferences.getStringList(key);

  bool isKeyExists(String key) => _preferences.containsKey(key);

  Future<bool> clearKey(String key) => _preferences.remove(key);

  Future<bool> clearAll() => _preferences.clear();
}
