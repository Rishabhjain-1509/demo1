import 'package:demo/Constant/constant.dart';
import 'package:demo/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:demo/Api/product.dart';
import 'package:demo/Cart/cart.dart';
import 'package:demo/Models/product.dart';
import 'package:demo/core/store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loaded = false;
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    products = await ProductApi().getProducts();
    setState(() {
      loaded = true;
    });
  }

  // AddProductToCart(products[index]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: maincolor,
          toolbarHeight: 60.0,
          elevation: 2,
          title: txtDesign("Products", 22.0, white, FontWeight.bold),
          automaticallyImplyLeading: false),
      floatingActionButton: VxBuilder(
        mutations: const {RemoveProductToCart, AddProductToCart},
        builder: (context, store, status) {
          return FloatingActionButton(
            backgroundColor: maincolor,
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return CartScreen();
              },
            )),
            child: const Icon(Icons.home, color: white),
          ).badge(
              color: Colors.red,
              size: 24,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
              count: (VxState.store as MyStore).cartProducts.length);
        },
      ),
      body: loaded
          ? products.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                txtDesign("${products[index].name}", 20.0,
                                    black, FontWeight.w500),
                                15.heightBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    txtDesign("${products[index].cost}", 17.0,
                                        grey, FontWeight.w500),
                                    InkWell(
                                      onTap: () {
                                        AddProductToCart(products[index]);
                                      },
                                      child: txtDesign("Add to cart", 17.0,
                                          black, FontWeight.w500),
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      );
                    },
                  ))
              : "No products to show".text.make()
          : CircularProgressIndicator().centered(),
    );
  }
}
