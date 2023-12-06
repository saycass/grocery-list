import 'package:flutter/material.dart';

double _like= 0.0;
double _unlike= 0.0;

class CounterItem extends StatefulWidget {
  const CounterItem({Key? key}) : super(key: key);

  @override
  State<CounterItem> createState() => _CounterItemState();
}

class _CounterItemState extends State<CounterItem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 20,
      width: 20,
      color: Colors.red,
    );
  }
}
