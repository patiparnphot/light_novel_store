import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_novel_store/models/lightNovel.dart';

class Firestore {
  final FirebaseFirestore firestore;

  Firestore({required this.firestore});

  Stream<QuerySnapshot> get lightNovels => firestore.collection("lightNovels")
      .snapshots();
      // .map(_lightNovelFromSnapshot);

  LightNovel lightNovelFromSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    return LightNovel(
      id: data["id"] ?? "",
      image: data["image"] ?? "",
      title: data["title"] ?? "",
      price: data["price"] ?? 0,
      description: data["description"] ?? "",
      size: data["size"] ?? 0,
      color: data["color"] != null ? Color(data["color"]) : Colors.black45,
      category: data["category"] ?? 0
    );
  }


}