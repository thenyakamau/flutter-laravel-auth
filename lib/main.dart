import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'injection_container.dart' as di;

import 'core/routes/RoutesGenerator.dart';
import 'core/utils/Constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  _setUpLogging();
  runApp(MyApp());
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name}:${event.time}:${event.message}');
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
            bodyText1: TextStyle(color: ksecondaryColor),
            bodyText2: TextStyle(color: ksecondaryColor)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // primarySwatch: Colors.blueAccent,
        primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
      ),
      initialRoute: '/',
      onGenerateRoute: RoutesGenerator.generateRoute,
    );
  }
}
