import 'dart:convert';

class ProductModel {
  final String name;
  final String cost;

  ProductModel(this.name, this.cost);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cost': cost,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      map['name'] ?? '',
      map['cost'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
