import 'package:crud/models/user.dart';
import 'package:crud/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatar'] = user.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = ModalRoute.of(context).settings.arguments as User;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de usuário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();
                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'],
                    name: _formData['name'],
                    email: _formData['email'],
                    avatarUrl: _formData['avatarUrl'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                onSaved: (value) => _formData['name'] = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value.trim().length <= 3) {
                    return 'Nome tem que ter no minimo 3 caracteres';
                  }

                  return 'Ocorreu um erro';
                },
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
                onSaved: (value) => _formData['e-mail'] = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'E-mail inválido';
                  }

                  if (value.trim().length <= 3) {
                    return 'E-mail tem que ter no minimo 3 caracteres';
                  }

                  return 'Ocorreu um erro';
                },
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(
                  labelText: 'URL do Avatar',
                ),
                onSaved: (value) => _formData['avatarUrl'] = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'URL inválida';
                  }

                  if (value.trim().length <= 3) {
                    return 'URL tem que ter no minimo 3 caracteres';
                  }
                  return 'Ocorreu um erro';
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
