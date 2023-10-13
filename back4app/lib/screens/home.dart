import 'dart:convert';

import 'package:back4app/models/cep.dart';
import 'package:back4app/repositories/cep_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();
  bool isLoading = false;
  CepModel? loadedCep;
  var cepRepo = CepRepository();

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  Future<CepModel> getCep(String cep) async {
    var response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    var data = jsonDecode(response.body);
    return CepModel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Opacity(
              opacity: isLoading ? 0.1 : 1, child: const Icon(Icons.save)),
          onPressed: () async {
            if (loadedCep != null) {
              await cepRepo.addCep(loadedCep!);
            }
          }),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          alignment: Alignment.center,
          child: TextField(
            onChanged: (value) async {
              setState(() {
                isLoading = true;
              });
              var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
              if (cep.length == 8) {
                CepModel data = await getCep(cep);
                setState(() {
                  loadedCep = data;
                  isLoading = false;
                });
              }
            },
            keyboardType: TextInputType.number,
            maxLength: 8,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Informe o cep..',
              hintText: 'Somente números',
            ),
          ),
        ),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : loadedCep != null
                ? Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Text(loadedCep!.cep),
                      Text(loadedCep!.logradouro),
                      Text(loadedCep!.bairro),
                      Text(loadedCep!.localidade),
                      Text(loadedCep!.uf),
                    ]),
                  )
                : Container()
      ]),
    );
  }
}
