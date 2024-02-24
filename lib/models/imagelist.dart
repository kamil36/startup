// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Product {
  String? title;
  dynamic image;
  String? desc;
  int? price;
  Product({
    this.title,
    required this.image,
    this.desc,
    this.price,
  });

  static List<dynamic> trending = [
    Product(title: "New", image: "assets/images/new.png"),
    Product(title: "Mobiles", image: "assets/images/mobiles.png"),
    Product(title: "Fashion", image: "assets/images/fashion.png"),
    Product(title: "Electronic", image: "assets/images/electronics.png"),
    Product(title: "Grocery", image: "assets/images/grocery.png"),
    Product(title: "New", image: "assets/images/new.png"),
    Product(title: "Mobiles", image: "assets/images/mobiles.png"),
    Product(title: "Fashion", image: "assets/images/fashion.png"),
    Product(title: "Electronic", image: "assets/images/electronics.png"),
    Product(title: "Grocery", image: "assets/images/grocery.png"),
    Product(title: "Grocery", image: "assets/images/fashion.png"),
  ];
}

List<dynamic> product = [
  Product(
      title: "Camera",
      image: "assets/images/camera.png",
      desc: dis,
      price: 100),
  Product(
      title: "Chocolates",
      image: "assets/images/chocolates.png",
      desc: dis,
      price: 200),
  Product(
      title: "Mask", image: "assets/images/mask.png", desc: dis, price: 300),
  Product(
      title: "Skin Care",
      image: "assets/images/skin.png",
      desc: dis,
      price: 400),
  Product(
      title: "Head Phone",
      image: "assets/images/headphone.png",
      desc: dis,
      price: 500),
  Product(
      title: "Helmet",
      image: "assets/images/helmet.png",
      desc: dis,
      price: 600),
  Product(
      title: "Power Bank",
      image: "assets/images/powerbank.png",
      desc: dis,
      price: 700),
  Product(
      title: "Mic Voice",
      image: "assets/images/mic.png",
      desc: dis,
      price: 800),
];
String dis =
    "A product description is a form of marketing copy used to describe and explain the benefits of your product.";

class CartAdd with ChangeNotifier {
  List<Product> item = [];

  List<Product> get items => item;
  int _itemCount = 0;

  int get itemCount => _itemCount;
  void addToCart(Product product) {
    item.add(product);
    _itemCount++;

    notifyListeners();
  }

  void reomveToCart(Product product) {
    item.remove(product);
    _itemCount--;
    notifyListeners();
  }

  double getTotalPrice() {
    return item.fold(0, (total, product) => total + (product.price ?? 0));
  }

  int get _itemsCount => item.length;
}
