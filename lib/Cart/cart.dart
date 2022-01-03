import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:demo/core/store.dart';
import 'package:demo/Constant/constant.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        toolbarHeight: 60.0,
        elevation: 2,
        title: txtDesign("Your Bag", 22.0, white, FontWeight.bold),
      ),
      body: VxBuilder(
          builder: (context, store, status) {
            final list = (VxState.store as MyStore).cartProducts;
            if (list.isNotEmpty) {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            txtDesign("${list[index].name}", 17.0, black,
                                FontWeight.bold),
                            txtDesign("${list[index].cost}", 15.0, grey,
                                FontWeight.bold),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: "No item added to cart".text.make(),
              );
            }
          },
          mutations: const {RemoveProductToCart, AddProductToCart}),
    );
  }
}
