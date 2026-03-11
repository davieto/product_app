import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource datasource;

  List<Product>? cache;

  ProductRepositoryImpl(this.datasource);

  @override
  Future<List<Product>> getProducts() async {
    try {
      final models = await datasource.getProducts();

      final products = models
          .map(
            (m) => Product(
              id: m.id,
              title: m.title,
              price: m.price,
              image: m.image,
            ),
          )
          .toList();

      cache = products;

      return products;
    } catch (e) {
      if (cache != null) {
        return cache!;
      }

      throw Exception("Erro ao carregar produtos");
    }
  }
}
