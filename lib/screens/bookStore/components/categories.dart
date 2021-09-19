import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final List<String> categories;
  final Function swapCategory;
  final int selectedIndex;

  const Categories({
    Key? key,
    required this.categories,
    required this.swapCategory,
    required this.selectedIndex
  }) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        widget.swapCategory(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.selectedIndex == index ? Colors.white : Color(0xFFACACAC)
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              height: 2,
              width: 30,
              color: widget.selectedIndex == index ? Colors.white54 : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}