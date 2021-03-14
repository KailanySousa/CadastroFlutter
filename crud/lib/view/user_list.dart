import 'package:crud/components/user_tile.dart';
import 'package:crud/models/user.dart';
import 'package:crud/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              users.put(
                User(
                    name: 'Gabriela',
                    email: 'gabriela@gmail.com',
                    avatarUrl: ''),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (cxt, i) => UserTile(users.byIndex(i)),
        itemCount: users
            .count, //carrega a lista de acordo com a quantidade a ser mostrada
      ),
    );
  }
}
