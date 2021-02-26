import 'package:amse_taquin/exercice4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

//MODEL
class Tile {
  Color color;
  String text;
  Tile(this.text, this.color);
}

//Widget
class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return this.textBox();
  }

  Widget textBox() {
    return Container(
      color: tile.color,
      child: Center(child: Text(tile.text)),
    );
  }
}

class Exercice6b_Page extends StatefulWidget{
  Exercice6b_Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Exercice6b_Page createState() => _Exercice6b_Page();
}

class _Exercice6b_Page extends State<Exercice6b_Page> {
  List<Widget> tiles;
  int indexRemove;

  _Exercice6b_Page() {
    indexRemove = random.nextInt(16);
    tiles = fillList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        while (tiles.isNotEmpty) tiles.removeLast();
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
                  children: [
                    for(Widget t in tiles) createWidgetForGrid(
                        t, tiles.indexOf(t)),
                  ]
              ),
            )
          ],),
        ),
      ),
    );
  }

  createWidgetForGrid(TileWidget t, int index) {
    if((index-1 == indexRemove && index%4 == 0) || (index+1 == indexRemove && indexRemove%4 == 0)){
      return t;
    } else {
      if (index+1 == indexRemove ||
          index-1 == indexRemove ||
          index+4 == indexRemove ||
          index-4 == indexRemove){
        return InkWell(
          child: Container(
            child: t,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                  width: 3,
                )
            ),
          ),
          onTap: () => swapTiles(index),
        );
      } else {
        return t;
      }
    }
  }

  swapTiles(int index){
    setState(() {
      if(indexRemove+1 == index){
        tiles.insert(indexRemove, tiles.removeAt(indexRemove+1));
        indexRemove++;
      } else if(indexRemove-1 == index){
        tiles.insert(indexRemove, tiles.removeAt(indexRemove-1));
        indexRemove--;
      } else if(indexRemove+4 == index){
        Widget cp = tiles.removeAt(index);
        tiles.insert(index, tiles.elementAt(indexRemove));
        tiles.removeAt(indexRemove);
        tiles.insert(indexRemove, cp);
        indexRemove+=4;
      } else if(indexRemove-4 == index){
        Widget cp = tiles.removeAt(index);
        tiles.insert(index, tiles.elementAt(indexRemove-1));
        tiles.removeAt(indexRemove);
        tiles.insert(indexRemove, cp);
        indexRemove-=4;
      }
    });
  }

  fillList() {
    return List<Widget>.generate(16, (index) =>
    index == indexRemove
        ? TileWidget(Tile("Removed  " + index.toString(), Colors.white))
        : TileWidget(Tile("Tile " + index.toString(), Colors.blueGrey)));
  }
}

math.Random random = new math.Random();