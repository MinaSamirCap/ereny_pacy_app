import '../prefs/pref_keys.dart';
import '../prefs/pref_util.dart';

class PrefManager {
  static Future<void> setLang(String data) async {
    return await PrefUtils.setString(PrefKeys.LANG, data);
  }

  static Future<String> getLang() async {
    return await PrefUtils.getString(PrefKeys.LANG);
  }

  static Future<void> setLogedIn() async {
    await PrefUtils.setBool(PrefKeys.IS_LOGED_IN, true);
  }

  static Future<bool> isLogedIn() async {
    return await PrefUtils.getBool(PrefKeys.IS_LOGED_IN);
  }

  static Future<void> setToken(String data) async {
    await PrefUtils.setString(PrefKeys.TOKEN, data);
  }

  static Future<String> getToken() async {
    return await PrefUtils.getString(PrefKeys.TOKEN);
  }

  static Future<void> clearAllData() async {
    await PrefUtils.clearData();
  }
}
