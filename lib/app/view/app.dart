import 'package:challenge_03/routes/route_names.dart';
import 'package:challenge_03/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenge CriptoMonedas',
      theme: ThemeData.dark(),
      initialRoute: initialViewRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
