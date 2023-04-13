import 'dart:convert';

import 'package:binding/domain/entities/category.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.images,
        // required this.creationAt,
        // required this.updatedAt,
        this.category,
    });

    int id;
    String title;
    int price;
    String description;
    List<String> images;
    // DateTime creationAt;
    // DateTime updatedAt;
    Category? category;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        // creationAt: DateTime.parse(json["creationAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        category: Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        // "creationAt": creationAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
        "category": category?.toJson(),
    };
}