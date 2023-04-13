class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}

enum Name { CLOTHES, SHOES, ELECTRONICS, OTHERS, CHANGE_TITLE }

final nameValues = EnumValues({
    "Change title": Name.CHANGE_TITLE,
    "Clothes": Name.CLOTHES,
    "Electronics": Name.ELECTRONICS,
    "Others": Name.OTHERS,
    "Shoes": Name.SHOES
});


class Category {
    Category({
        required this.id,
        required this.name,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });

    int id;
    Name name;
    String image;
    DateTime creationAt;
    DateTime updatedAt;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
