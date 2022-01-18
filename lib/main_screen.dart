import 'package:flutter/material.dart';
import 'package:ungtu_final_project_kozyrev/appBar_and_navDrawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: navAppBar('Главный экран', context),
        drawer: navDrawer(context),
        body: Container(),
    );
  }
}
