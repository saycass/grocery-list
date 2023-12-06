class ToBuy {
  String ? id;
  String ? toBuyText;
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
      ToBuy(id: "01".toString(), toBuyText: "Eggs", isDone:true),
      ToBuy(id: "01".toString(), toBuyText: "Coffee"),
      ToBuy(id: "01".toString(), toBuyText: "Milk"),
      ToBuy(id: "01".toString(), toBuyText: "Lemon"),
    ];
  }
}