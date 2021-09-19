import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_novel_store/models/lightNovel.dart';
import 'package:light_novel_store/screens/bookStore/components/body.dart';
import 'package:light_novel_store/services/firebaseAuth.dart';
import 'package:light_novel_store/services/firebaseFirestore.dart';

class BookStore extends StatefulWidget {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  const BookStore({
    Key? key,
    required this.firebaseAuth,
    required this.firebaseFirestore
  }) : super(key: key);

  @override
  _BookStoreState createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore(firestore: widget.firebaseFirestore).lightNovels,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text("Something Wrong!!!"),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Text("Loading...."),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                key: const ValueKey("SignOut"),
                icon: const Icon(Icons.exit_to_app),
                onPressed: () async {
                  final String res = await Auth(auth: widget.firebaseAuth)
                      .signOut();
                  if (res != "Success") {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(
                            content: Text(res)
                        )
                    );
                  }
                },
              )
            ],
          ),
          body: Body(
              lightNovels: snapshot.data!.docs.map(
                  Firestore(firestore: widget.firebaseFirestore)
                      .lightNovelFromSnapshot
              ).toList()
          ),
        );

      }

    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("DETAIL SCREEN"),
    );
  }
}
