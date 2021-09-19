import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_novel_store/screens/bookStore/main.dart';
import 'package:light_novel_store/screens/login/main.dart';
import 'package:light_novel_store/services/firebaseAuth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Root();
          }

          return const Scaffold(
            body: Center(
              child: Text("Loading...."),
            ),
          );

        },
      ),
    );
  }
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: Auth(auth: _firebaseAuth).user,
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {

          if (snapshot.connectionState == ConnectionState.active) {

            if (snapshot.data?.uid == null) {
              return Login(
                firebaseAuth: _firebaseAuth,
                firebaseFirestore: _firebaseFirestore,
              );
            } else {
              return BookStore(
                firebaseAuth: _firebaseAuth,
                firebaseFirestore: _firebaseFirestore,
              );
            }

          } else {

            return const Scaffold(
              body: Center(
                child: Text("Loading...."),
              ),
            );

          }
        }
    );
  }
}