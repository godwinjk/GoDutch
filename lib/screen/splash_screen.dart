import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_share/screen/home.dart';

import 'curve_paiinter.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Group Share"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
TextEditingController numberController= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: TextField(
                  controller: numberController,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      hintStyle: TextStyle(color: Colors.white, fontSize: 30),
                      hintText: 'Enter number of person'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                onPressed: () {
                  if(numberController.text.isEmpty ){
                    Fluttertoast.showToast(
                        msg: "Please enter a value",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    return;
                  }
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) => Home(int.parse(numberController.text))));
                  // Navigator.pushNamed(context, Home.routeName);
                },
                color: Colors.blueAccent,
                padding: EdgeInsets.all(20),
                elevation: 20,
                child: Text("Gooooo",
                    style: TextStyle(color: Colors.white, fontSize: 30)),
              ),
              CustomPaint(
                painter: CurvePainter(),
              ),],
          ),
        ),
      ),
    );
  }
}
