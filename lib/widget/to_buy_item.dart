import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/to_buy.dart';
import 'counter_item.dart';

double _add = 0;


class ToBuyItem extends StatefulWidget {
  final ToBuy tobuy;
  final void Function(ToBuy) onToBuyChanged;
  final void Function(String) onDeleteItem;

  const ToBuyItem(
      {Key? key,
      required this.tobuy,
      required this.onToBuyChanged,
      required this.onDeleteItem})
      : super(key: key);

  @override
  State<ToBuyItem> createState() => _ToBuyItemState();
}

class _ToBuyItemState extends State<ToBuyItem> {
  int count = 0;

  final toBuyList = ToBuy.toBuyList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40, top: 20),
      child: Dismissible(
        key: Key(widget.tobuy.toBuyText),
        onDismissed: (direction) {
          setState(() {
            widget.onDeleteItem (widget.tobuy.id);
            toBuyList.remove(widget.tobuy);

          });
        },
        child: ExpansionTile(
          title: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 5),
            tileColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                widget.onToBuyChanged(widget.tobuy);
              },
              icon: Icon(
                widget.tobuy.isDone
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: Colors.purple,
              ),
            ),
            title: Text(
              widget.tobuy.toBuyText!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                decoration:
                    widget.tobuy.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Container(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.symmetric(vertical: 7),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "$_add",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          children: <Widget>[
            ListTile(
              leading: IconButton(
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.purple,
                ),
                onPressed: () {
                  widget.tobuy.add();
                    setState(() {
                      _add += 1;
                      count. toString();
                    });
                },
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.remove_circle,
                  color: Colors.purple,
                ),
                onPressed: () {
                  widget.tobuy.remove();
                  setState(() {
                    _add -= 1;
                    count. toString();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
