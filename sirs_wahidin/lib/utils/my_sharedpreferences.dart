import 'package:shared_preferences/shared_preferences.dart';
import 'package:sirs_wahidin/models/user.dart';

Future<User> loadPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  User user = User(
    isLogin: prefs.getBool(User.keyIsLogin) ?? false,
    token: prefs.getString(User.keyToken) ?? "",
    name: prefs.getString(User.keyName) ?? "",
  );
  return user;
}

savePreference(User user) async {
  User currentUser = await loadPreference();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(User.keyIsLogin, user.isLogin!);
  prefs.setString(User.keyToken, user.token);
  prefs.setString(User.keyName, user.name);

}

Future<bool> checkLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(User.keyIsLogin) ?? false;
}
