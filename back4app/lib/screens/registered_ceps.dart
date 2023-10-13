import 'package:back4app/models/cep.dart';
import 'package:back4app/models/ceps_back4App.dart';
import 'package:back4app/repositories/cep_repository.dart';
import 'package:flutter/material.dart';

class RegisteredCepsScreen extends StatefulWidget {
  const RegisteredCepsScreen({super.key});

  @override
  State<RegisteredCepsScreen> createState() => _RegisteredCepsScreenState();
}

class _RegisteredCepsScreenState extends State<RegisteredCepsScreen> {
  var cepRepo = CepRepository();
  var ceps = <CepModel>[];
  bool isLoading = false;

  Future<void> getCeps() async {
    setState(() {
      isLoading = true;
    });
    CepsBack4App res = await cepRepo.getCeps();
    setState(() {
      isLoading = false;
      ceps = res.results;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCeps();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: ceps.length,
            itemBuilder: (context, index) => ListTile(
              title: Text('${ceps[index].logradouro}, ${ceps[index].bairro}',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground)),
              subtitle: Text(
                ceps[index].cep,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              trailing: Text(ceps[index].uf),
            ),
          );
  }
}
