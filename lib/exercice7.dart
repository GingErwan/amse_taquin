import 'package:amse_taquin/exercice4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  bool isEmpty;

  TileWidget(this.tile, this.alignment, this.isEmpty);

  @override
  Widget build(BuildContext context) {
    return this.isEmpty
      ? Container(color: Colors.white)
      : croppedImageTile();
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
  int indexRemovedTile, moves, difficultyLevel;
  bool gameOn, hasWon;
  List<TileWidget> tilesGrid;
  List<int> availableMoves;

  BodyTilesAppState() {
    moves = 0;
    difficultyLevel = 1;
    gameOn = false;
    hasWon = false;
    availableMoves = List<int>();
    tilesGrid = fillList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: gridSize,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              children: [for(Widget t in tilesGrid) createWidgetForGrid(t, tilesGrid.indexOf(t)),]
            ),
          ),

          Container(
            alignment: Alignment.center,
            child: !this.hasWon
              ? null
              : Center(child: Container(
                child: Container(
                  alignment: Alignment.center,
                  child:
                    Text("You Won!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent, fontSize: 50)
                    ),
                ),
            )),
          ),

          SizedBox(height: 50),

          Container(
            child: !this.gameOn
            ? Row(children: [
                Text("Difficulty -",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 20)
                ),
                Expanded(child: Slider(
                  min: 1,
                  max: 5,
                  value: this.difficultyLevel.toDouble(),
                  divisions: 4,
                  label: this.difficultyLevel.toString(),
                  onChanged: (double value) {setState(() {
                    this.difficultyLevel = value.toInt();
                  });},
                )),
               ],
              )
            : null,
          ),

          SizedBox(height: 10),

          Container(
            alignment: Alignment.centerLeft,
            child: Text("Moves - " + this.moves.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 20)
            ),
          ),

          SizedBox(height: 50),

        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(gameOn ? Icons.stop_rounded : Icons.play_arrow_rounded),
        onPressed: () {
          setState(() {
            if(!this.gameOn) {
              this.indexRemovedTile = random.nextInt(gridSize*gridSize);
              tilesGrid = fillList();
              this.startBoard();
              this.hasWon = false;
              this.moves = 0;
            }else{
              this.indexRemovedTile = null;
              tilesGrid = fillList();
            }
            this.gameOn = !this.gameOn;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Expanded(child: IconButton(
                icon: Icon(Icons.remove, color: (!this.gameOn && gridSize > 2) ? Colors.blueGrey: Colors.redAccent),
                onPressed: () {
                  if (!this.gameOn && gridSize > 2) {
                    setState(() {
                      gridSize--;
                      tilesGrid = fillList();
                    });
                  }
                },
              ),
            ),

            Expanded(child: IconButton(
                icon: Icon(Icons.add, color: (!this.gameOn && gridSize < 10) ? Colors.blueGrey : Colors.redAccent),
                onPressed: () {
                  if (!this.gameOn && gridSize < 10) {
                    setState(() {
                      gridSize++;
                      tilesGrid = fillList();
                    });
                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  createWidgetForGrid(TileWidget t, int index) {
    if((index-1 == indexRemovedTile && index%gridSize == 0) || (index+1 == indexRemovedTile && indexRemovedTile%gridSize == 0)){
      return t;
    } else {
      if (index+1 == indexRemovedTile ||
          index-1 == indexRemovedTile ||
          index+gridSize == indexRemovedTile ||
          index-gridSize == indexRemovedTile){
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

  startBoard(){
    for(int i=0; i<this.difficultyLevel*50; i++){
      getAvailableMoves();
      swapTiles(this.availableMoves[random.nextInt(this.availableMoves.length)]);
    }
  }

  getAvailableMoves(){
    this.availableMoves = [];
    for(int i=0; i<tilesGrid.length; i++){
      if(!(i-1 == indexRemovedTile && i%gridSize == 0) &&
        !(i+1 == indexRemovedTile && indexRemovedTile%gridSize == 0)){
        if (i+1 == indexRemovedTile ||
            i-1 == indexRemovedTile ||
            i+gridSize == indexRemovedTile ||
            i-gridSize == indexRemovedTile){
          this.availableMoves.add(i);
        }
      }
    }
  }

  swapTiles(int index){
    setState(() {
      if(indexRemovedTile+1 == index){
        tilesGrid.insert(indexRemovedTile, tilesGrid.removeAt(indexRemovedTile+1));
        indexRemovedTile++;
        moves++;
      } else if(indexRemovedTile-1 == index){
        tilesGrid.insert(indexRemovedTile, tilesGrid.removeAt(indexRemovedTile-1));
        indexRemovedTile--;
        moves++;
      } else if(indexRemovedTile+gridSize == index){
        Widget cp = tilesGrid.removeAt(index);
        tilesGrid.insert(index, tilesGrid.elementAt(indexRemovedTile));
        tilesGrid.removeAt(indexRemovedTile);
        tilesGrid.insert(indexRemovedTile, cp);
        indexRemovedTile+=gridSize;
        moves++;
      } else if(indexRemovedTile-gridSize == index){
        Widget cp = tilesGrid.removeAt(index);
        tilesGrid.insert(index, tilesGrid.elementAt(indexRemovedTile-1));
        tilesGrid.removeAt(indexRemovedTile);
        tilesGrid.insert(indexRemovedTile, cp);
        indexRemovedTile-=gridSize;
        moves++;
      }

      if(gameOn){
        if(checkWin()){
          this.hasWon = true;
          this.gameOn = false;
          this.indexRemovedTile = null;
          tilesGrid = fillList();
        }
      }
    });

  }

  fillList() {
    List<TileWidget> listTemp = List<TileWidget>();

    for(double i=0; i<gridSize; i++){
      for(double j=0; j<gridSize; j++){
        j+i*gridSize == this.indexRemovedTile
            ? listTemp.add(TileWidget(
          Tile((j+i*gridSize).toInt()),
          Alignment(j/(gridSize-1)*2 - 1, i/(gridSize-1)*2- 1),
          true,
        ))
            : listTemp.add(TileWidget(
          Tile((j+i*gridSize).toInt()),
          Alignment(j/(gridSize-1)*2 - 1, i/(gridSize-1)*2 - 1),
          false,
        ));
      }
    }
    return listTemp;
  }

  bool checkWin(){
    return listEquals(getIndexGrid(), getIndexInit()) ? true : false;
  }

  List<int> getIndexGrid(){
    return List<int>.generate(gridSize*gridSize, (index) => tilesGrid.elementAt(index).tile.number);
  }

  List<int> getIndexInit(){
    return List<int>.generate(gridSize*gridSize, (index) => index);
  }

}