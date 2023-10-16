import 'package:camera/models/user.dart';
import 'package:camera/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var enteredName = '';
  var enteredEmail = '';
  var enteredPassword = '';
  var image = '';

  final _formKey = GlobalKey<FormState>();
  var userRepo = UserRepository();

  XFile? photo;

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      userRepo.createUser(User(
          name: enteredName,
          email: enteredEmail,
          password: enteredPassword,
          profileImage: image));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFormField(
                decoration: InputDecoration(label: Text('Nome')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome é obrigatório';
                  }
                  return null;
                },
                onSaved: (value) {
                  enteredName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(label: Text('Email')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email é obrigatório';
                  }
                  return null;
                },
                onSaved: (value) {
                  enteredEmail = value!;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(label: Text('Senha')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Senha é obrigatório';
                  }
                  return null;
                },
                onSaved: (value) {
                  enteredPassword = value!;
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      photo =
                          await picker.pickImage(source: ImageSource.camera);
                      if (photo != null) {
                        String path = (await path_provider
                                .getApplicationDocumentsDirectory())
                            .path;
                        String name = basename(photo!.path);
                        await photo!.saveTo('$path/$name');
                        await GallerySaver.saveImage(photo!.path);
                        image = photo!.path;
                      }
                    },
                    icon: Icon(Icons.upload),
                    tooltip: 'Tirar foto de perfil',
                  ),
                  Text('Tirar foto de perfil')
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    submitForm();
                  },
                  child: Text('Cadastrar'))
            ]),
          ),
        )
      ]),
    );
  }
}
