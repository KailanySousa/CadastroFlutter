import 'package:crud/components/user_tile.dart';
import 'package:crud/data/dummy_users.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (cxt, i) => UserTile(users.values.elementAt(i)),
        itemCount: users
            .length, //carrega a lista de acordo com a quantidade a ser mostrada
      ),
    );
  }
}
