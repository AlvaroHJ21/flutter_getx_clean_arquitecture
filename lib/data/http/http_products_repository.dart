import 'package:binding/domain/entities/product.dart';
import 'package:binding/domain/repositories/products_repository.dart';
import 'package:get/get.dart';

class HttpProductsRepository implements ProductsRepository {
  final apiUrl = "https://api.escuelajs.co/api/v1";

  final _connect = GetConnect();

  @override
  Future<List<Product>> getProducts({int? limit, int? offset}) async {
    final result = await _connect.get<List<Product>>('$apiUrl/products',
        query: {'limit': limit ?? 0, 'offset': offset ?? 10});

    print(result);
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
