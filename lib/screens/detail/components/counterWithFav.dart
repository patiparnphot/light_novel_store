import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_novel_store/screens/detail/components/cartCounter.dart';

class CounterWithFav extends StatelessWidget {
  final Function addItem;
  final Function removeItem;
  final int numOfItem;

  const CounterWithFav({
    Key? key,
    required this.addItem,
    required this.removeItem,
    required this.numOfItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(
          addItem: () {
            addItem();
          },
          removeItem: () {
            removeItem();
          },
          numOfItem: numOfItem,
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.check_box),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
