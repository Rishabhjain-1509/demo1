import 'package:velocity_x/velocity_x.dart';
import 'package:demo/Models/product.dart';
import 'package:demo/Models/user.dart';

class MyStore extends VxStore {
  UserModel? userModel;
  List<ProductModel> cartProducts = [];
  MyStore();
}

class AddProductToCart extends VxMutation<MyStore> {
  final ProductModel productModel;

  AddProductToCart(this.productModel);
  @override
  perform() {
    store!.cartProducts.add(productModel);
  }
}

class RemoveProductToCart extends VxMutation<MyStore> {
  final ProductModel productModel;

  RemoveProductToCart(this.productModel);
  @override
  perform() {
    store!.cartProducts.remove(productModel);
  }
}

class AddUserModel extends VxMutation<MyStore> {
  final UserModel model;

  AddUserModel(this.model);
  @override
  perform() {
    store!.userModel = model;
  }
}
