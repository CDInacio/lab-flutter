import 'package:flutter/material.dart';
import 'package:http_requests/models/CEP.dart';
import 'package:http_requests/repositories/cep_repository.dart';

class CepsScreen extends StatefulWidget {
  const CepsScreen({super.key});

  @override
  State<CepsScreen> createState() => _CepsScreenState();
}

class _CepsScreenState extends State<CepsScreen> {
  final _cepController = TextEditingController();
  var loadedCep = CEP();
  var cepRepository = CepRepository();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
                maxLength: 8,
                keyboardType: TextInputType.number,
                controller: _cepController,
                onChanged: (String value) async {
                  setState(() {
                    _isLoading = true;
                  });

                  var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (cep.length == 8) {
                    CEP cepData = await cepRepository.fetchCep(cep);
                    setState(() {
                      loadedCep = cepData;
                      _isLoading = false;
                    });
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'CEP',
                  hintText: 'Digite o CEP',
                ),
              ),
              Visibility(
                visible: _isLoading,
                replacement: Column(children: [
                  Text(
                    '${loadedCep.localidade ?? ''}  ${loadedCep.uf ?? ''}',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Text(
                    loadedCep.logradouro ?? '',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ]),
                child: const CircularProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
