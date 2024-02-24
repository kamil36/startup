// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:start_up/models/imagelist.dart';
import 'package:start_up/models/razorpay.dart';


int cartItemCount = 0;

void updateCartBadge(BuildContext context, int itemCount) {
  cartItemCount = itemCount;
  Provider.of<CartAdd>(context, listen: false);
}

class ItemPage extends StatefulWidget {
  int index;
  int _cartItemCount = 0;

  int get cartItemCount => _cartItemCount;

  ItemPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              SizedBox(height: 20),
              Image.asset(
                "${product[widget.index].image}",
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.cover,
              ),
              Text(
                "${product[widget.index].title}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize:
                        Theme.of(context).textTheme.headlineLarge?.fontSize,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "\u20B9 ${product[widget.index].price}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium?.fontSize,
                ),
              ),
              Text(
                "${product[widget.index].desc}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(400, 70),
                    backgroundColor: Colors.grey[800]),
                onPressed: () {
                  setState(() {
                    CartAdd cart = Provider.of<CartAdd>(context, listen: false);

                    if (product.isNotEmpty) {
                      Product selectedProduct = product[widget.index];
                      cart.addToCart(selectedProduct);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                          "${product[widget.index].title} has been added !",
                        ),
                      ));
                    }
                  });
                },
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MyRazorPay(),
            ],
          ),
        ),
      ),
    );
  }
}
