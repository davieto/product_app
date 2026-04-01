import 'package:flutter/material.dart';
import 'api_product_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela Inicial")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ApiProductListPage()),
            );
          },
          child: const Text("Ver Produtos"),
        ),
      ),
    );
  }
}
