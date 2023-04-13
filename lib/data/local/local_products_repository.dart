import 'package:binding/domain/entities/product.dart';
import 'package:binding/domain/repositories/products_repository.dart';

class LocalProductsRepository implements ProductsRepository {
  final List<Product> products = [
    Product(
      id: 1,
      title: 'Red Label',
      description: 'Culpa excepteur id quis ipsum dolor ut amet reprehenderit.',
      price: 10,
      images: [
        'https://images.unsplash.com/photo-1534221905680-192a9a88ac81?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVkJTIwbGFiZWx8ZW58MHx8MHx8&w=1000&q=80',
        'https://preview.redd.it/cha8j34x8vg61.jpg?width=640&crop=smart&auto=webp&s=3eb09fd26dba27d7e1670df4a681e825a884d33b'
      ],
    ),
    Product(
      id: 2,
      title: 'Baileys Original',
      description: 'Culpa excepteur id quis ipsum dolor ut amet reprehenderit.',
      price: 20,
      images: [
        'https://plazavea.vteximg.com.br/arquivos/ids/21216687-512-512/166799.jpg',
        'https://http2.mlstatic.com/D_NQ_NP_986694-MLB42566449072_072020-O.jpg'
      ],
    ),
    Product(
      id: 3,
      title: 'Damasco',
      description: 'Culpa excepteur id quis ipsum dolor ut amet reprehenderit.',
      price: 30,
      images: [
        'https://images.tcdn.com.br/img/img_prod/845352/licor_weber_haus_de_damasco_500ml_279_1_2c306093f390de5b3f2ffe15802154cd.jpg',
        'https://preview.redd.it/cha8j34x8vg61.jpg?width=640&crop=smart&auto=webp&s=3eb09fd26dba27d7e1670df4a681e825a884d33b'
      ],
    ),
  ];

  @override
  Future<List<Product>> getProducts({int? limit, int? offset}) {
    return Future(
      () => products,
    );
  }
}
