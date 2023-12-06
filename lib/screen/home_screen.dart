import 'package:flutter/material.dart';
import 'package:grocery_list/model/to_buy.dart';
import 'package:grocery_list/widget/counter_item.dart';
import 'package:grocery_list/widget/to_buy_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final toBuyList = ToBuy.toBuyList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          "Grocery List",
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
                          onToBuyChanged: _handleToBuyChange,
                          onDeleteItem: () {},
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
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
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "add a new grocery item",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.purple,
                      minimumSize:  const Size (60,60),
                      elevation: 0),
                    child: const  Icon (
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToBuyChange (ToBuy tobuy) {
    setState(() {
      tobuy.isDone = !tobuy.isDone;
    });
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
            height: 40,
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
