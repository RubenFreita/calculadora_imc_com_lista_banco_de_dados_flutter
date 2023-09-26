import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ImcItem extends StatelessWidget {
  const ImcItem({super.key, required this.imc});
  final Map<String, dynamic> imc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        elevation: 1,
        child: ListTile(
          title: Text(
            imc["classificacao"].toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          subtitle: Text("IMC: ${imc["imc"].toString()}"),
          trailing: Text(
            DateFormat('dd MMM yyyy', 'pt_BR')
                .format(
                  imc["data"],
                )
                .toString(),
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
