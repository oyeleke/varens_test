import 'package:flutter/material.dart';
import 'package:varens_test/constants/font_family.dart';
import 'package:varens_test/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

final lightTheme = ThemeData(
  fontFamily: FontFamily.quicksand,
  textTheme: const TextTheme(
    headline5: TextStyle(fontSize: 38, fontWeight: FontWeight.w700),
  ),
);
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: FontFamily.quicksand,
  textTheme: const TextTheme(
    headline5: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Widgets',
      theme: lightTheme.copyWith(
        // platform: TargetPlatform.iOS,
        colorScheme: lightTheme.colorScheme.copyWith(
          primary: Colors.red,
          secondary: Colors.green,
        ),
      ),
      darkTheme: darkTheme,
      // themeMode: ThemeMode.dark,
      home: const MainPage(),
    );
}


}
