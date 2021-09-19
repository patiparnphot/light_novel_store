import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_novel_store/services/firebaseAuth.dart';

class Login extends StatefulWidget {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  const Login({
    Key? key,
    required this.firebaseAuth,
    required this.firebaseFirestore
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Builder(builder: (BuildContext context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  key: const ValueKey("username"),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: "Username"),
                  controller: _emailController,
                ),
                TextFormField(
                  key: const ValueKey("password"),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: "Password"),
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  key: const ValueKey("signIn"),
                  onPressed: () async {
                    final String res = await Auth(auth: widget.firebaseAuth).signIn(
                        email: _emailController.text,
                        password: _passwordController.text
                    );
                    if (res == "Success") {
                      _emailController.clear();
                      _passwordController.clear();
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                            content: Text(res)
                        )
                      );
                    }
                  },
                  child: Text("SignIn"),
                ),
                FlatButton(
                  key: const ValueKey("signUp"),
                  onPressed: () async {
                    final String res = await Auth(auth: widget.firebaseAuth).createAccount(
                        email: _emailController.text,
                        password: _passwordController.text
                    );
                    if (res == "Success") {
                      _emailController.clear();
                      _passwordController.clear();
                    } else {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(
                              content: Text(res)
                          )
                      );
                    }
                  },
                  child: Text("SignUp"),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
