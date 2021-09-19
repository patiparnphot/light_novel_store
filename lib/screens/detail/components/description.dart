import 'package:flutter/cupertino.dart';
import 'package:light_novel_store/models/lightNovel.dart';

class Description extends StatelessWidget {
  final LightNovel lightNovel;

  const Description({
    Key? key,
    required this.lightNovel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        lightNovel.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
