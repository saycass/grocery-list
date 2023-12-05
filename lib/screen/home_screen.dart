import 'package:flutter/material.dart';
import 'package:grocery_list/model/to_buy.dart';
import 'package:grocery_list/widget/to_buy_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final toBuyList = ToBuy.toBuyList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          "All to Buy",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToBuy tobuy in toBuyList)
                        ToBuyItem(
                          tobuy: tobuy,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric( horizontal: 20, vertical: 5),
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                      child: TextField (
                        decoration: InputDecoration (
                          hintText:  "add a new to buy item",
                          border:  InputBorder.none,
                        ),
                      ),
                ),
                ),
                IconButton(onPressed: () {},
                    icon: Icon( Icons.add,
                      color: Colors.purple,
                      size: 20,
                    ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container searchBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.purple,
            size: 20,
          ),
          // prefixIconConstraints: BoxConstraints(
          //   maxWidth: 25,
          //   maxHeight: 20,
          // ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.purple,
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            size: 38,
            color: Colors.purple,
          ),
          SizedBox(
            width: 40,
            height: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const Image(
                image: AssetImage("assets/images/profile.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
