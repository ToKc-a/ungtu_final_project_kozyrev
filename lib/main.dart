import 'package:flutter/material.dart';
import 'package:ungtu_final_project_kozyrev/about_app_screen.dart';
import 'package:ungtu_final_project_kozyrev/main_screen.dart';
import 'auth_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/main',
      routes: {
        '/exit': (context) => AuthScreen(),
        '/main': (context) => const MainScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}