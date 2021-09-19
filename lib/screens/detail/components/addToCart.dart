import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_novel_store/models/lightNovel.dart';

class AddToCart extends StatelessWidget {
  final LightNovel lightNovel;
  final int selectedColor;
  final int numOfItem;

  const AddToCart({
    Key? key,
    required this.lightNovel,
    required this.selectedColor,
    required this.numOfItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> colors = ["blue", "yellow", "grey"];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 20.0),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              border: Border.all(
                color: lightNovel.color
              )
            ),
            child: IconButton(
              icon: const Icon(Icons.add_shopping_cart_rounded),
              color: Colors.white54,
              onPressed: () => {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)
                ),
                color: lightNovel.color,
                onPressed: () => {
                  print("${numOfItem.toString()} of ${colors[selectedColor]} ${lightNovel.title}")
                },
                child: Text(
                  "Buy now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
