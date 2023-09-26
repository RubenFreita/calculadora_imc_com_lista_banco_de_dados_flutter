import 'package:flutter/material.dart';

import '../model/imc.dart';
import '../utils/utils.dart';

class ImcForm extends StatelessWidget {
  ImcForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double? peso;
    double? altura;
    TextEditingController alturaController = TextEditingController(text: "");
    TextEditingController pesoController = TextEditingController(text: "");
    void onSubmitedForm(BuildContext context) {
      final isValid = _formKey.currentState?.validate() ?? false;
      if (!isValid) {
        return;
      }
      _formKey.currentState?.save();
      Utils.adicionaImc(Imc(altura!, peso!));
      pesoController.text = "";
      alturaController.text = "";
      Navigator.of(context).pop();
    }

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        child: Wrap(
          children: [
            const Text(
              "Ensira sua altura",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              onEditingComplete: () => onSubmitedForm(context),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              autofocus: true,
              controller: alturaController,
              validator: (value) {
                if (value!.contains(",")) value = value.replaceFirst(",", ".");

                final altura = double.tryParse(value) ?? 0;
                if (altura == 0) {
                  return "Altura Inválida";
                }
                return null;
              },
              onSaved: (value) {
                if (value == null) return;
                if (value.contains(",")) value = value.replaceFirst(",", ".");
                altura = double.parse(value);
              },
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Ensira seu peso",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              onEditingComplete: () => onSubmitedForm(context),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              controller: pesoController,
              validator: (value) {
                if (value!.contains(",")) value = value.replaceFirst(",", ".");
                final peso = double.tryParse(value) ?? 0;
                if (peso == 0) {
                  return "Peso Inválida";
                }
                return null;
              },
              onSaved: (value) {
                if (value == null) return;
                if (value.contains(",")) value = value.replaceFirst(",", ".");
                peso = double.parse(value);
              },
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => onSubmitedForm(context),
                    child: const Text("Adicionar"))
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
