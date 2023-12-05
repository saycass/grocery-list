import 'package:flutter/material.dart';

import '../model/to_buy.dart';

class ToBuyItem extends StatelessWidget {
  final ToBuy tobuy;

  const ToBuyItem({Key? key, required this.tobuy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin : const EdgeInsets.only(bottom: 20),
      child: ListTile (
        onTap:  () {
          print ( "Clicked on to Buy Item.");
        },
        shape: RoundedRectangleBorder (
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding:const EdgeInsets.symmetric(horizontal: 20, vertical: 5) ,
        tileColor: Colors.white,
        leading:  Icon ( tobuy.isDone?
          Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.purple,
        ),
        title:   Text ( tobuy.toBuyText!,
          style:  TextStyle (
            fontSize: 16,
            color: Colors.black,
            decoration: tobuy.isDone? TextDecoration.lineThrough: null,
          ),
        ),
        trailing: Container (
          padding:  const EdgeInsets.all  (0),
          margin: const EdgeInsets.symmetric(vertical: 7),
          height: 35,
          width: 35,
          decoration: BoxDecoration (
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton (
            onPressed:  () {
              print (" Clicked on delete item.");
            },
            color: Colors.white,
            iconSize:  18,
            icon: const  Icon (
              Icons.delete,
            ),
          ),
        ),
      ),
    );
  }
}
