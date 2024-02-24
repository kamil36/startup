// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:start_up/models/imagelist.dart';

class TopItemPage extends StatefulWidget {
  int index;

  TopItemPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<TopItemPage> createState() => _TopItemPageState();
}

class _TopItemPageState extends State<TopItemPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                "${Product.trending[widget.index].image}",
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              Text(
                "${Product.trending[widget.index].title}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        Theme.of(context).textTheme.headlineLarge?.fontSize,
                    fontWeight: FontWeight.bold),
              ),
              // Text(
              //   "\u20B9 ${Product.trending[index].price}",
              //   style: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     color: Colors.white,
              //     fontSize:
              //         Theme.of(context).textTheme.headlineMedium?.fontSize,
              //   ),
              // ),
              // Text(
              //   "${Product.trending[index]?.desc}",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(400, 70),
                    backgroundColor: Colors.grey[800]),
                onPressed: () {},
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(400, 70),
                    backgroundColor: Colors.grey[800]),
                onPressed: () {},
                child: Text(
                  "Buy now",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
