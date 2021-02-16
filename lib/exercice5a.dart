import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exercice5a_Page extends StatefulWidget{
  Exercice5a_Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Exercice5a_Page createState() => _Exercice5a_Page();
}

class _Exercice5a_Page extends State<Exercice5a_Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            Container(child: Text("oui")),
            Container(child: Text("oui")),
          ],
        ),
      ),
    );
  }
}