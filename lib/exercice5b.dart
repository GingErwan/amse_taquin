import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exercice5b_Page extends StatefulWidget{
  Exercice5b_Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Exercice5b_Page createState() => _Exercice5b_Page();
}

class _Exercice5b_Page extends State<Exercice5b_Page> {
  @override
  Widget build(BuildContext context) {

    for(double i=-1; i<2; i++){
      for(double j=-1; j<2; j++){
        tiles.add(new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(j, i)));
      }
    }

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
            SizedBox(width: 512/3, height: 512/3, child: Container(child: this.createTileWidgetFrom(tiles[0]))),
            SizedBox(width: 512/3, height: 512/3, child: Container(child: this.createTileWidgetFrom(tiles[1]))),
            SizedBox(width: 512/3, height: 512/3, child: Container(child: this.createTileWidgetFrom(tiles[2]))),

            SizedBox(width: 512/3, height: 512/3, child: Container(child: this.createTileWidgetFrom(tiles[3]))),
            SizedBox(width: 512/3, height: 512/3, child: Container(child: this.createTileWidgetFrom(tiles[4]))),
            SizedBox(width: 512/3, height: 512/3, child: Container(child: this.createTileWidgetFrom(tiles[5]))),

            SizedBox(width: 512/3, height: 512/3, child: Container(child: this.createTileWidgetFrom(tiles[6]))),
            SizedBox(width: 512/3, height: 512/3, child: Container(child: this.createTileWidgetFrom(tiles[7]))),
            SizedBox(width: 512/3, height: 512/3, child: Container(child: this.createTileWidgetFrom(tiles[8]))),
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
            widthFactor: 0.33,
            heightFactor: 0.33,
            child: Image.network(this.imageURL),
            ),
          ),
        ),
      );
    }
}

List<Tile> tiles = new List<Tile>();