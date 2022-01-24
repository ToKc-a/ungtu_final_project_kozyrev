import 'package:async/async.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ungtu_final_project_kozyrev/users.dart';
import 'package:flutter/material.dart';

import 'appBar_and_navDrawer.dart';

class DetailedInfo extends StatefulWidget {
  final User user;

  const DetailedInfo({Key? key, required this.user}) : super(key: key);

  @override
  _DetailedInfoState createState() => _DetailedInfoState();
}

class _DetailedInfoState extends State<DetailedInfo> {
  Future<List<Todo>> loadToDos() async {
    final responce = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?userId=' +
            widget.user.id.toString()));

    if (responce.statusCode == 200) {
      return List<Todo>.from(
          jsonDecode(responce.body).map((user) => Todo.fromJson(user)));
    } else {
      throw Exception('Загрузка не удалась');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navAppBar('Задачи ${widget.user.name}', context),
      drawer: navDrawer(context),
      body: Center(
        child: FutureBuilder<List<Todo>>(
          future: loadToDos(),
          builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Детальная информация:'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Имя: ${widget.user.name}'
                            '${widget.user.username}'),
                        Text('Телефон: ${widget.user.phone}'),
                        Text('Сайт: ${widget.user.website}'),
                        Text('Адрес: ${widget.user.address.getAddress()}'),
                        Text(
                            'Название компании: ${widget.user.company.getCompany()}'),
                      ],
                    ),
                  ),
                  Divider(),
                  Center(
                    child: Text(
                      'Задачи',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  for (var item in snapshot.data!)
                    Card(
                      elevation: 1,
                      child: ListTile(
                        onTap: () {},
                        title: Text(item.title),
                        trailing: Checkbox(
                          checkColor: Color(0xFF03203e),
                          value: item.completed,
                          onChanged: null,
                        ),
                      ),
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
        ),
      ),
    );
  }
}
