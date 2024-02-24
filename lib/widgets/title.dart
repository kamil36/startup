import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [
          Text(
            "Flipkart",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                "Explore  ",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Plus",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Color(0xFFF8E831),
                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
