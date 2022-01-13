import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ungtu_final_project_kozyrev/main_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        //'/exit': (context) => AuthScreen(),
        '/main': (context) => MainScreen(),
        //'/contacts': (context) => ContactScreen(),
      },
    );
  }
}

Widget navDrawer(context) => Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: SvgPicture.asset('images/Google-flutter-logo.svg'),
                    )
                  ],
                ),
              )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Главный экран'),
            onTap: () {
              Navigator.pushNamed(context, '/main');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Контакты'),
            onTap: () {
              Navigator.pushNamed(context, '/contacts');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Выход на экран авторизации'),
            onTap: () {
              Navigator.pushNamed(context, '/exit');
            },
          ),
        ],
      ),
    );

PreferredSizeWidget navAppBar(String text, context) {
  return AppBar(
    title: Text(text),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/main');
          },
          icon: Icon(Icons.home)),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/contacts');
          },
          icon: Icon(Icons.contacts)),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/exit');
          },
          icon: Icon(Icons.exit_to_app)),
    ],
  );
}