import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exercice6b_Page extends StatefulWidget{
  Exercice6b_Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Exercice6b_Page createState() => _Exercice6b_Page();
}

class _Exercice6b_Page extends State<Exercice6b_Page> {
  List<Widget> tiles = List<Widget>.generate(16, (index) => TileWidget(Tile(Colors.blueGrey, Text("Tile " + index.toString()))));

  @override
  Widget build(BuildContext context) {

    int indexRemove = random.nextInt(15);
    TileWidget toRemove = tiles.elementAt(indexRemove) as TileWidget;
    toRemove.tile.text = Text("Remove " + indexRemove.toString());
    toRemove.tile.color = Colors.white;

    return WillPopScope(
      onWillPop: () {
        while(tiles.isNotEmpty) tiles.removeLast();
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Container(
          margin: const EdgeInsets.all(5.0),
          child: Row(children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: [for(Widget t in tiles) SizedBox(width: 120, height: 120, child: Container(child: t))],
              ),
            )
          ],),
        ),
      ),
    );
  }

}

class Tile {
  Color color;
  Text text;
  Tile(this.color, this.text);
}

class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return this.coloredBox();
  }

  Widget coloredBox() {
    return Container(
        color: tile.color,
        child: Center(child: tile.text),
        );
  }
}

math.Random random = new math.Random();