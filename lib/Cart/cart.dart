import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:demo/core/store.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VxBuilder(
          builder: (context, store, status) {
            return SizedBox();
          },
          mutations: const {RemoveProductToCart, AddProductToCart}),
    );
  }
}
