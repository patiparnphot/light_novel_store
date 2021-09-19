import 'package:flutter/material.dart';
import 'package:light_novel_store/models/lightNovel.dart';
import 'package:light_novel_store/screens/detail/components/body.dart';

class Detail extends StatelessWidget {
  final LightNovel lightNovel;

  const Detail({
    Key? key,
    required this.lightNovel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightNovel.color,
      appBar: AppBar(
        backgroundColor: lightNovel.color,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white54,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Body(
          lightNovel: lightNovel
      ),
    );
  }
}
