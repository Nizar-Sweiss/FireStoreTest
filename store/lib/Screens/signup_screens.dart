import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
  TextEditingController userNameFeild = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 170),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                      fontFamily: 'ZenTokyoZoo'),
                )),
          ),
          TextFormField(
            //To take the input when it login
            controller: emailFeild,

            style: TextStyle(color: Colors.white),
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
                  color: Colors.white,
                ),
                hoverColor: Color.fromARGB(255, 255, 255, 255)),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            //To take the input when it login
            controller: userNameFeild,
            style: TextStyle(color: Colors.white),
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
                  color: Colors.white,
                ),
                hoverColor: Color.fromARGB(255, 255, 255, 255)),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            //To take the input when it login
            controller: passwordFeild,
            style: TextStyle(color: Colors.white),
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
                  color: Colors.white,
                ),
                hoverColor: Color.fromARGB(255, 255, 255, 255)),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            //To take the input when it login
            controller: phoneFeild,
            style: TextStyle(color: Colors.white),
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
                  color: Colors.white,
                ),
                hoverColor: Color.fromARGB(255, 255, 255, 255)),
            keyboardType: TextInputType.phone,
          ),
          Container(
            width: 200,
            height: 50,
            color: Color.fromARGB(255, 113, 33, 134),
            child: MaterialButton(
              onPressed: () {},
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
    );
  }
}
