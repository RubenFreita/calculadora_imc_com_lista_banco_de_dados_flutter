import 'package:calculadora_imc_list_flutter/model/imc.dart';

class Utils {
  static void adicionaImc(Imc imc) {
    double valorImc = double.parse(imc.calculaImc().toStringAsFixed(2));
    Imc.listImc.add({
      "imc": valorImc,
      "data": DateTime.now(),
      "classificacao": classificaImc(valorImc)
    });
  }

  static String classificaImc(double imc) {
    String message = "";
    if (imc < 16) {
      message = "Magreza grave";
    } else if (imc >= 16 && imc < 17) {
      message = "Magreza moderada";
    } else if (imc >= 17 && imc < 18.5) {
      message = "Magreza leve";
    } else if (imc >= 18.5 && imc < 25) {
      message = "Saudável";
    } else if (imc >= 25 && imc < 30) {
      message = "Sobrepeso";
    } else if (imc >= 30 && imc < 35) {
      message = "Obesidade Grau I";
    } else if (imc >= 35 && imc < 40) {
      message = "Obesidade Grau II";
    } else if (imc >= 40) {
      message = "Obesidade Grau III";
    }
    return message;
  }
}
