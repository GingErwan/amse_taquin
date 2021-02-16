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
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: [
            Container(color: Colors.deepPurple, child:Center(child: Text("Tile 1"))),
            Container(color: Colors.blueGrey, child:Center(child: Text("Tile 2"))),
            Container(color: Colors.grey, child:Center(child: Text("Tile 3"))),

            Container(color: Colors.redAccent, child:Center(child: Text("Tile 4"))),
            Container(color: Colors.amberAccent, child:Center(child: Text("Tile 5"))),
            Container(color: Colors.cyanAccent, child:Center(child: Text("Tile 6"))),

            Container(color: Colors.tealAccent, child:Center(child: Text("Tile 7"))),
            Container(color: Colors.red, child:Center(child: Text("Tile 8"))),
            Container(color: Colors.lightGreenAccent, child:Center(child: Text("Tile 9"))),
          ],
        ),
      ),
    );
  }
}