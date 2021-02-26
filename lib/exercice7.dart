import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exercice7 extends StatelessWidget{
  final String title;
  Exercice7({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(5.0),
        child: BodyTilesApp(),
      ),
    );
  }
}

class BodyTilesApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => BodyTilesAppState();
}

class BodyTilesAppState extends State<BodyTilesApp>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Jeu du taquin"),
    );
  }
}