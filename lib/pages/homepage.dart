import 'package:calculadora_imc_list_flutter/components/imc_form.dart';
import 'package:calculadora_imc_list_flutter/components/imc_list.dart';
import 'package:flutter/material.dart';

import '../model/imc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            "Calculadora IMC",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Histórico de IMC",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            Expanded(child: ImcList(imcList: Imc.listImc)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: ImcForm(),
                );
              },
            ).then((value) {
              setState(() {});
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
