import 'package:flutter/material.dart';
import 'package:start_up/models/imagelist.dart';
import 'package:start_up/pages/top_item.dart';


class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: Product.trending.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TopItemPage(
                        index: index,
                      );
                    }));
                  },
                  child: Container(
                      height: 70,
                      child: Image.asset(
                        "${Product.trending[index].image}",
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TopItemPage(
                      index: index,
                    );
                  }));
                },
                child: Container(
                    child: Text(
                  "${Product.trending[index].title}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ],
          );
        });
  }
}
