import 'package:back4app/models/cep.dart';

class CepsBack4App {
  List<CepModel> results = [];

  CepsBack4App(this.results);

  CepsBack4App.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <CepModel>[];
      json['results'].forEach((v) {
        results.add(CepModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }
}
