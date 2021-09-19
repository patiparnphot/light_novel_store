import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_novel_store/models/lightNovel.dart';
import 'package:light_novel_store/screens/detail/components/addToCart.dart';
import 'package:light_novel_store/screens/detail/components/colorAndSize.dart';
import 'package:light_novel_store/screens/detail/components/counterWithFav.dart';
import 'package:light_novel_store/screens/detail/components/description.dart';
import 'package:light_novel_store/screens/detail/components/lightNovelWithImage.dart';

class Body extends StatefulWidget {
  final LightNovel lightNovel;

  const Body({
    Key? key,
    required this.lightNovel
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<int> colors = [0xFF356C95, 0xFFF8C078, 0xFFA29B9B];
  int selectedColor = 0;
  int numOfItem = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: 20.0,
                      right: 20.0
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0)
                      )
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(
                        lightNovel: widget.lightNovel,
                        colors: colors,
                        selectedColor: selectedColor,
                        swapColor: (index) => {
                          setState(() {
                            selectedColor = index;
                          })
                        },
                      ),
                      SizedBox(height: 10.0),
                      Description(lightNovel: widget.lightNovel),
                      SizedBox(height: 10.0),
                      CounterWithFav(
                        addItem: () {
                          setState(() {
                            numOfItem ++;
                          });
                        },
                        removeItem: () {
                          setState(() {
                            numOfItem --;
                          });
                        },
                        numOfItem: numOfItem,
                      ),
                      SizedBox(height: 10.0),
                      AddToCart(
                        lightNovel: widget.lightNovel,
                        selectedColor: selectedColor,
                        numOfItem: numOfItem,
                      )
                    ],
                  ),
                ),
                LightNovelWithImage(lightNovel: widget.lightNovel)
              ],
            ),
          )

        ],
      ),
    );
  }
}
