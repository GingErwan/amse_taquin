import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exercice5c_Page extends StatefulWidget{
  Exercice5c_Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Exercice5c_Page createState() => _Exercice5c_Page();
}

class _Exercice5c_Page extends State<Exercice5c_Page> {
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
            for(Tile t in tiles) SizedBox(width: 512/3, height: 512/3, child: Container(child: this.createTileWidgetFrom(t))),
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