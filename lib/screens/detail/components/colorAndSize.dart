import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_novel_store/models/lightNovel.dart';

class ColorAndSize extends StatelessWidget {
  final LightNovel lightNovel;
  final List<int> colors;
  final Function swapColor;
  final int selectedColor;

  const ColorAndSize({
    Key? key,
    required this.lightNovel,
    required this.colors,
    required this.selectedColor,
    required this.swapColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Color"),
              SizedBox(
                height: 29,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) => buildColor(index)
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.white54),
              children: [
                TextSpan(text: "Size\n"),
                TextSpan(
                  text: "${lightNovel.size} cm",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold)
                )
              ]
            ),
          ),
        )
      ],
    );
  }

  Widget buildColor(int index) {
    return GestureDetector(
        onTap: () {
          swapColor(index);
        },
        child: Container(
          margin: EdgeInsets.only(
              top: 5.0,
              right: 10.0
          ),
          padding: EdgeInsets.all(2.5),
          height: 24,
          width: 24,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: selectedColor == index ? Color(colors[index]) : Colors.transparent
              )
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Color(colors[index]),
                shape: BoxShape.circle
            ),
          ),
        ),
    );
  }
}