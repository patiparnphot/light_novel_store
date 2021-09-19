import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_novel_store/models/lightNovel.dart';
import 'package:light_novel_store/screens/detail/main.dart';

import '../main.dart';
import 'categories.dart';
import 'itemCard.dart';

class Body extends StatefulWidget {
  final List<LightNovel> lightNovels;

  const Body({
    Key? key,
    required this.lightNovels
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> categories = ["Fantasy", "Romance", "Action", "Adventure"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Light Novel",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Categories(
          categories: categories,
          selectedIndex: selectedIndex,
          swapCategory: (index) => {
            setState(() {
              selectedIndex = index;
            })
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.builder(
              itemCount: widget.lightNovels
                  .where((i) => i.category == selectedIndex).toList().length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: widget.lightNovels
                    .where((i) => i.category == selectedIndex).toList()[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail(
                            lightNovel: widget.lightNovels
                                .where((i) => i.category == selectedIndex)
                                .toList()[index]
                        )
                    )
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}