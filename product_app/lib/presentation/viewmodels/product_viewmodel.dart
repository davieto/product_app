import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../core/state/ui_state.dart';

class ProductViewModel {
  final ProductRepository repository;

  final ValueNotifier<List<Product>> products = ValueNotifier([]);

  final ValueNotifier<UiState> state = ValueNotifier(UiState.initial);

  final ValueNotifier<String?> errorMessage = ValueNotifier(null);

  ProductViewModel(this.repository);

  Future<void> loadProducts() async {
    state.value = UiState.loading;

    try {
      final result = await repository.getProducts();

      products.value = result;

      state.value = UiState.success;
    } catch (e) {
      errorMessage.value = e.toString();

      state.value = UiState.error;
    }
  }
}
