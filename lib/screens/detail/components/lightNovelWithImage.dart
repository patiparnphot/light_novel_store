import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_novel_store/models/lightNovel.dart';

class LightNovelWithImage extends StatelessWidget {
  final LightNovel lightNovel;

  const LightNovelWithImage({
    Key? key,
    required this.lightNovel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> categories = ["Fantasy", "Romance", "Action", "Adventure"];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            categories[lightNovel.category],
            style: TextStyle(color: Colors.white54),
          ),
          Text(
            lightNovel.title,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(
                  color: Colors.white54,
                  fontWeight: FontWeight.bold
                ),
          ),
          SizedBox(height: 20.0,),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${lightNovel.price}",
                      style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(
                          color: Colors.white54,
                          fontWeight: FontWeight.bold
                        ),
                    )
                  ]
                ),
              ),
              SizedBox(width: 20.0,),
              Expanded(
                child: Hero(
                  tag: "${lightNovel.id}",
                  child: Image.asset(
                    lightNovel.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
