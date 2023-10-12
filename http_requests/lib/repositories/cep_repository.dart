import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_requests/models/CEP.dart';

class CepRepository {
  Future<CEP> fetchCep(String cep) async {
    var response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return CEP.fromJson(json);
    }
    return CEP();
  }
}
