import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            leading: Icon(Icons.account_circle),
            title: Text('О приложении'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
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
            Navigator.pushNamed(context, '/about');
          },
          icon: Icon(Icons.account_circle)),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/exit');
          },
          icon: Icon(Icons.exit_to_app)),
    ],
  );
}