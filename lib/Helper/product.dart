import 'package:demo/Api/product.dart';
import 'package:demo/Models/product.dart';

class ProductHelper {
  Future<List<ProductModel>> getProducts() async {
    return await ProductApi().getProducts();
  }
}
