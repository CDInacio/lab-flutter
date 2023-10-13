class CepModel {
  String cep = '';
  String logradouro = '';
  String bairro = '';
  String localidade = '';
  String uf = '';
  String ibge = '';
  String ddd = '';
  String siafi = '';

  CepModel(this.cep, this.logradouro, this.bairro, this.localidade, this.uf,
      this.ibge, this.ddd, this.siafi);

  CepModel.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    ddd = json['ddd'];
    siafi = json['siafi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ibge'] = ibge;
    data['ddd'] = ddd;
    data['siafi'] = siafi;
    return data;
  }
}
