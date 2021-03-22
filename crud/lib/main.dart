import 'package:crud/provider/users.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:crud/view/user_form.dart';
import 'package:crud/view/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: UserList(),
        routes: {
          AppRoutes.HOME: (ctx) => UserList(),
          AppRoutes.USER_FORM: (ctx) => UserForm()
        },
      ),
    );
  }
}
