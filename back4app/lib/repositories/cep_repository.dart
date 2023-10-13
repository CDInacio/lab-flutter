import 'package:back4app/models/cep.dart';
import 'package:back4app/models/ceps_back4App.dart';
import 'package:dio/dio.dart';

class CepRepository {
  var _dio = Dio();

  CepRepository() {
    _dio = Dio();
    _dio.options.headers['X-Parse-Application-Id'] =
        'dlhC4B1IlBdUCscVfozXZkvBzvP9PVuyEhdE75YP';
    _dio.options.headers['X-Parse-REST-API-Key'] =
        'UqPhGiH3zS6pRzK7R9NucFP47IT9QF6RSQkSmMQm';
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }

  Future<CepsBack4App> getCeps() async {
    try {
      var response = await _dio.get('/ceps');
      return CepsBack4App.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addCep(CepModel cep) async {
    print(cep.toJson());
    try {
      await _dio.post('/ceps', data: cep.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
