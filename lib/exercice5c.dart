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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Row(children: [
              Text("Taille:"),
              Expanded(
                child: Slider(
                  min: 3,
                  max: 10,
                  value: _numSlider,
                  divisions: 8,
                  label: _numSlider.toString(),
                  onChanged: (double value) {
                    setState((){
                      _numSlider = value;
                    });
                  },
                ),
              ),
            ],),

            GridView.count(
              scrollDirection: Axis.horizontal,
              crossAxisCount: _numSlider.toInt(),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              children: [
                for(Tile t in tiles) SizedBox(width: 512/_numSlider, height: 512/_numSlider, child: Container(child: this.createTileWidgetFrom(t))),
              ],
            ),
          ],
        ),
      ),
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