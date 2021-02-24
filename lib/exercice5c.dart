import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Exercice5c_Page extends StatefulWidget{
  Exercice5c_Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Exercice5c_Page createState() => _Exercice5c_Page();
}

class _Exercice5c_Page extends State<Exercice5c_Page> {

  @override
  Widget build(BuildContext context) {

    for(double i=-1; i<=1; i+= 2/(_numSlider-1)){
      for(double j=-1; j<=1; j+= 2/(_numSlider-1)){
        tiles.add(new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(j, i)));
      }
    }

    return WillPopScope(
      onWillPop: () {
        while(tiles.isNotEmpty) tiles.removeLast();
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          margin: const EdgeInsets.all(5.0),
          child: Column(
            children: [

              Expanded(
                child: GridView.count(
                  crossAxisCount: _numSlider.toInt(),
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  children: [
                    for(Tile t in tiles) SizedBox(width: 512/_numSlider, height: 512/_numSlider, child: Container(child: this.createTileWidgetFrom(t))),
                  ],
                ),
              ),

              Row(children: [
                Text("Taille:"),
                Expanded(
                  child: Slider(
                    min: 2,
                    max: 10,
                    value: _numSlider,
                    divisions: 8,
                    label: _numSlider.toInt().toString(),
                    onChanged: (double value) {
                      while(tiles.isNotEmpty){
                        tiles.removeLast();
                      }
                      setState((){
                        _numSlider = value;
                      });
                    },
                  ),
                ),
              ],),
            ],
          ),
        ),
      )
    );

  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }

}

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({this.imageURL, this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 1/_numSlider,
            heightFactor: 1/_numSlider,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

double _numSlider = 3;
List<Tile> tiles = new List<Tile>();