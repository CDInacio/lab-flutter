import 'dart:io';

import 'package:camera/models/user.dart';
import 'package:camera/models/userBack4App.dart';
import 'package:camera/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  var users = <User>[];
  var userRepo = UserRepository();

  Future<void> getUsers() async {
    UserBack4AppResponse response = await userRepo.getUsers();
    setState(() {
      users = response.results!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuários cadastrados')),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) => ListTile(
                leading: Image.file(File(users[index].profileImage!)),
                title: Text(users[index].name!),
                subtitle: Text(users[index].email!),
              )),
    );
  }
}
