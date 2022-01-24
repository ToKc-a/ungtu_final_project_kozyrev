import 'package:flutter/material.dart';
import 'package:ungtu_final_project_kozyrev/appBar_and_navDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import 'package:ungtu_final_project_kozyrev/users.dart';

import 'detailed_info.dart';

Future<List<User>> loadUsers() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    return List<User>.from(
        jsonDecode(response.body).map((user) => User.fromJson(user)));
  } else {
    throw Exception('Не удалось загрузить пользователей');
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navAppBar('Главный экран', context),
      drawer: navDrawer(context),
      body: Center(
          child: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                for (var item in snapshot.data!)
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailedInfo(user: item),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF03203e),
                      child: Text('${item.id}'),
                    ),
                    title: Text(item.name),
                    subtitle: Text(item.email),
                  )
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}
