import 'package:flutter/foundation.dart';

class ToBuy {
  String  id;
  String  toBuyText;
  late bool isDone;
  int count = 0;

  ToBuy ({
    required this.id,
    required this.toBuyText,
    this.isDone = false,

});

  static List <ToBuy> toBuyList () {
    return [
      ToBuy(id: "01".toString(), toBuyText: "ketchup", isDone:true),
      ToBuy(id: "02".toString(), toBuyText: "Eggs", isDone:true),
      ToBuy(id: "03".toString(), toBuyText: "Coffee"),
      ToBuy(id: "04".toString(), toBuyText: "Milk"),
      ToBuy(id: "05".toString(), toBuyText: "Lemon"),
    ];
  }

  void add() {}

  void remove() {}
}