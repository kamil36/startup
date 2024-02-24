import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:start_up/models/imagelist.dart';


class MyMiddle extends StatefulWidget {
  MyMiddle({super.key});

  @override
  State<MyMiddle> createState() => _MyMiddleState();
}

class _MyMiddleState extends State<MyMiddle> {
  final List<Product> crousel = [
    Product(image: "assets/images/veg.png"),
    Product(image: "assets/images/chocolates.png"),
    Product(image: "assets/images/veg.png"),
    Product(image: "assets/images/chocolates.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return Container(
          child: Image.asset(
            "${crousel[index].image}",
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: crousel.length,
      options: CarouselOptions(
        aspectRatio: 1.5,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          setState(() {});
        },
      ),
    );
  }
}
