import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

//GLOBAL
String imageURL = 'https://picsum.photos/512';
math.Random random = new math.Random();
int gridSize = 3;

//MODEL
class Tile {
  int number;
  Tile(this.number);
}

//WIDGET
class TileWidget extends StatelessWidget {
  final Tile tile;
  AlignmentGeometry alignment;
  bool emptyTile;

  TileWidget(this.tile, this.alignment);

  @override
  Widget build(BuildContext context) {
    return this.textBox();
  }

  Widget textBox() {
    return Container(
      child: Center(child: Text(tile.number.toString())),
    );
  }

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 1/gridSize,
            heightFactor: 1/gridSize,
            child: Image.network(imageURL),
          ),
        ),
      ),
    );
  }

}


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
  int indexRemovedTile;
  bool gameOn;
  List<Widget> tilesGrid;

  BodyTilesAppState() {
    gameOn = false;
    tilesGrid = fillList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: gridSize,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: [
                  for(Widget t in tilesGrid) SizedBox(width: 512/gridSize, height: 512/gridSize, child: createWidgetForGrid(t, tilesGrid.indexOf(t))),
                ],
              )
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(gameOn ? Icons.stop_rounded : Icons.play_arrow_rounded),
          onPressed: () {
            setState(() {
              this.gameOn = !this.gameOn;
              if(this.gameOn) {
                this.indexRemovedTile = random.nextInt(gridSize*gridSize);
                TileWidget cp = tilesGrid.removeAt(indexRemovedTile);
                tilesGrid.insert(indexRemovedTile, TileWidget(Tile(indexRemovedTile), cp.alignment));
              }else{
                this.indexRemovedTile = null;
              }
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Expanded(child: IconButton(
                  icon: Icon(Icons.add, color: (!this.gameOn && gridSize < 10) ? Colors.blueGrey : Colors.redAccent),
                  onPressed: () {
                    if (!this.gameOn && gridSize < 10) {
                      setState(() {
                        gridSize++;
                        tilesGrid = fillList();
                      });}
                    },
                ),
              ),
              Expanded(child: IconButton(
                  icon: Icon(Icons.remove, color: (!this.gameOn && gridSize > 2) ? Colors.blueGrey: Colors.redAccent),
                  onPressed: () {
                    if (!this.gameOn && gridSize > 2) {
                      setState(() {
                        gridSize--;
                        tilesGrid = fillList();
                      });}
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  fillList() {
    return List<Widget>.generate(gridSize*gridSize, (index) => TileWidget(Tile(index), Alignment((index%gridSize)/gridSize*2-1, (index%gridSize)/gridSize*2-1)));
  }

  createWidgetForGrid(TileWidget t, int index) {
    if((index-1 == indexRemovedTile && index%gridSize == 0) || (index+1 == indexRemovedTile && indexRemovedTile%gridSize == 0)){
      return t.croppedImageTile();
    } else {
      if (index+1 == indexRemovedTile ||
          index-1 == indexRemovedTile ||
          index+gridSize == indexRemovedTile ||
          index-gridSize == indexRemovedTile){
        return InkWell(
          child: Container(
            child: t.croppedImageTile(),
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
        return t.croppedImageTile();
      }
    }
  }

  swapTiles(int index){
    setState(() {
      if(indexRemovedTile+1 == index){
        tilesGrid.insert(indexRemovedTile, tilesGrid.removeAt(indexRemovedTile+1));
        indexRemovedTile++;
      } else if(indexRemovedTile-1 == index){
        tilesGrid.insert(indexRemovedTile, tilesGrid.removeAt(indexRemovedTile-1));
        indexRemovedTile--;
      } else if(indexRemovedTile+gridSize == index){
        Widget cp = tilesGrid.removeAt(index);
        tilesGrid.insert(index, tilesGrid.elementAt(indexRemovedTile));
        tilesGrid.removeAt(indexRemovedTile);
        tilesGrid.insert(indexRemovedTile, cp);
        indexRemovedTile+=gridSize;
      } else if(indexRemovedTile-gridSize == index){
        Widget cp = tilesGrid.removeAt(index);
        tilesGrid.insert(index, tilesGrid.elementAt(indexRemovedTile-1));
        tilesGrid.removeAt(indexRemovedTile);
        tilesGrid.insert(indexRemovedTile, cp);
        indexRemovedTile-=gridSize;
      }
    });
  }

}