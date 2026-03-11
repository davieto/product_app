import 'package:flutter/material.dart';
import '../viewmodels/product_viewmodel.dart';
import '../../domain/entities/product.dart';
import '../../core/state/ui_state.dart';

class ProductPage extends StatelessWidget {
  final ProductViewModel viewModel;

  const ProductPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),

      body: ValueListenableBuilder<UiState>(
        valueListenable: viewModel.state,
        builder: (context, state, _) {
          if (state == UiState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state == UiState.error) {
            return Center(
              child: Text(
                viewModel.errorMessage.value ?? "Erro ao carregar dados",
              ),
            );
          }

          if (state == UiState.success) {
            return ValueListenableBuilder<List<Product>>(
              valueListenable: viewModel.products,
              builder: (context, products, _) {
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ListTile(
                      leading: Image.network(product.image),
                      title: Text(product.title),
                      subtitle: Text("\$${product.price}"),
                    );
                  },
                );
              },
            );
          }

          return const Center(child: Text("Clique no botão para carregar"));
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.loadProducts,
        child: const Icon(Icons.download),
      ),
    );
  }
}
