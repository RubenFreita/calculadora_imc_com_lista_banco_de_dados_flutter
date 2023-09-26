class Imc {
  final double _altura;
  final double _peso;
  static final List<Map<String, dynamic>> listImc = [];

  Imc(this._altura, this._peso);

  double get altura => _altura;
  double get peso => _peso;

  double calculaImc() {
    return peso / (altura * altura);
  }
}
