import 'package:flutter/material.dart';
import 'package:start_up/widgets/appbar.dart';
import 'package:start_up/widgets/drawer.dart';
import 'package:start_up/widgets/gridview.dart';
import 'package:start_up/widgets/listview.dart';
import 'package:start_up/widgets/middle.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: MyAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                child: MyListView(),
              ),
              MyMiddle(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Just for You",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: MyGridView(),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        // bottomNavigationBar: Container(
        //   height: 60,
        //   child: BottomNavigationBar(
        //       iconSize: 20,
        //       items: <BottomNavigationBarItem>[
        //         BottomNavigationBarItem(
        //           icon: Image.asset(
        //             "assets/icons/shop.png",
        //             fit: BoxFit.cover,
        //           ),
        //           tooltip: "Shop",
        //           label: "Shop",
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Image.asset(
        //             "assets/icons/supercoin.png",
        //             fit: BoxFit.cover,
        //           ),
        //           tooltip: "SuperCoin",
        //           label: "SuperCoin",
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Image.asset(
        //             "assets/icons/game.png",
        //             fit: BoxFit.cover,
        //           ),
        //           tooltip: "Game",
        //           label: "Game",
        //         ),
        //       ]),
        // ),
      ),
    );
  }
}
