// ignore_for_file: empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/Models/product.dart';

class ProductApi {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Products');

  Future<List<ProductModel>> getProducts() async {
    Map<String, dynamic> map = {};
    List<ProductModel> products = [];
    try {
      await productCollection.doc("product").get().then((value) => {
            if (value.exists)
              {
                map = value.data() as Map<String, dynamic>,
              }
          });
    } catch (e) {}

    if (map != {}) {
      List l1 = map['products'];
      for (var element in l1) {
        products.add(ProductModel.fromMap(element));
      }
    }
    return products;
  }
}
