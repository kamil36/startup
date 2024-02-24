import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/imagelist.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartAdd cart = Provider.of<CartAdd>(context);

    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.lightBlue,
        //   title: Text("Cart Page"),
        // ),
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "My Orders",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                Product product = cart.items[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Card(
                    child: ListTile(
                      leading: Expanded(child: Image.asset("${product.image}")),
                      title: Expanded(child: Text("${product.title}")),
                      subtitle: Expanded(child: Text('\$${product.price}')),
                      trailing: IconButton(
                        onPressed: () {
                          cart.reomveToCart(product);
                        },
                        icon: Icon(Icons.cancel),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Container(
              // color: Colors.red,
              width: double.infinity,
              height: 50,
              child: Center(
                  child: Text(
                'Total: \$${cart.getTotalPrice()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                ),
              ))),
        ],
      ),
    ));
  }
}
