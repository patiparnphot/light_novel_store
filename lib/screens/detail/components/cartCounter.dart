import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatelessWidget {
  final Function addItem;
  final Function removeItem;
  final int numOfItem;

  const CartCounter({
    Key? key,
    required this.addItem,
    required this.removeItem,
    required this.numOfItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () => {
            if (numOfItem > 1) {
              removeItem()
            }
          }
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            numOfItem.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () => {
              addItem()
            }
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({required IconData icon, required Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0)
        ),
        onPressed: () => press(),
        child: Icon(icon),
      ),
    );
  }

}
