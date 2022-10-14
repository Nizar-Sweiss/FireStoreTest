import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/Screens/screens.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 24, 26, 54),
        body: SignInScreen(),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailFeild = TextEditingController();
  TextEditingController passwordFeild = TextEditingController();
  TextEditingController phoneFeild = TextEditingController();
  TextEditingController nameFeild = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 170),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 100, fontFamily: 'ZenTokyoZoo'),
                  )),
            ),
            TextFormField(
              //To take the input when it login
              controller: emailFeild,

              style: TextStyle(),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: "Email ",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(213, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  hoverColor: Color.fromARGB(255, 255, 255, 255)),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              //To take the input when it login
              controller: nameFeild,
              style: TextStyle(),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: "User Name ",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(213, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  hoverColor: Color.fromARGB(255, 255, 255, 255)),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              //To take the input when it login
              controller: passwordFeild,

              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: "Password ",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(213, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  hoverColor: Color.fromARGB(255, 255, 255, 255)),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              //To take the input when it login
              controller: phoneFeild,

              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: "Phone Number",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(213, 255, 255, 255)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  hoverColor: Color.fromARGB(255, 255, 255, 255)),
              keyboardType: TextInputType.phone,
            ),
            Container(
              width: 200,
              height: 50,
              color: Color.fromARGB(255, 113, 33, 134),
              child: MaterialButton(
                onPressed: () {
                  final name = nameFeild.text;
                  final email = emailFeild.text;
                  final password = passwordFeild.text;
                  final phone = phoneFeild.text;
                  signUpUserToFireStore(
                      userName: name,
                      userEmail: email,
                      userPassword: password,
                      userPhone: phone);
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future signUpUserToFireStore(
    {required String userName,
    required String userEmail,
    required String userPassword,
    required String userPhone}) async {
  //Reference to the docs
  final docUser = FirebaseFirestore.instance.collection("users").doc("test-id");

  final json = {
    "name": userName,
    "email": userEmail,
    "password": userPassword,
    "phone": userPhone
  };

  //Create doc and write data to Firebase
  await docUser.set(json);
}
