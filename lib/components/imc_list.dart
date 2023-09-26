import 'package:calculadora_imc_list_flutter/components/imc_item.dart';
import 'package:flutter/material.dart';

class ImcList extends StatelessWidget {
  const ImcList({super.key, required this.imcList});
  final List<Map<String, dynamic>> imcList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imcList.length,
      itemBuilder: (context, index) {
        return ImcItem(imc: imcList[index]);
      },
    );
  }
}
