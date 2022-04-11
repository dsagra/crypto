import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  factory Preferences() => _instancia;
  Preferences._internal();
  static final Preferences _instancia = Preferences._internal();

  late SharedPreferences _prefs;

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  List<String> get coins => _prefs.getStringList('coins') ?? [];

  set coins(List<String> value) => _prefs.setStringList('coins', value);
}
