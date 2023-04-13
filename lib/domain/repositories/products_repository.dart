import 'package:binding/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts({int? limit, int? offset});
}
