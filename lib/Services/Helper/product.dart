//Created By Rishabh Jain.
//Created On Jan 3, 2022

import 'package:demo/Models/product.dart';
import 'package:demo/Services/Api/product.dart';

class ProductHelper {
  Future<List<ProductModel>> getProducts() async {
    return await ProductApi().getProducts();
  }
}
