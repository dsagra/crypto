import 'package:challenge_03/app/view/app.dart';
import 'package:challenge_03/util/preferences.dart';
import 'package:challenge_03/util/setup.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Preferences _prefs = Preferences();
  await _prefs.initPrefs();
  setup();
  runApp(const MyApp());
}
