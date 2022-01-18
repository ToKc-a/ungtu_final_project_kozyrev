import 'package:flutter/material.dart';
import 'package:ungtu_final_project_kozyrev/appBar_and_navDrawer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({
    Key? key,
  }) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navAppBar('О приложении', context),
      drawer: navDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Приложение создано в рамках итогового задания по курсу '
              '"Разработка кросс-платформенных мобильных приложений на Flutter для iOS и Android" '
              'Козыревым Антоном Игоревичем',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
