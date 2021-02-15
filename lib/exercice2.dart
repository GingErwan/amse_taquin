import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exercice2_Page extends StatefulWidget{
  Exercice2_Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Exercice2_Page createState() => _Exercice2_Page();
}

class _Exercice2_Page extends State<Exercice2_Page>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }

}