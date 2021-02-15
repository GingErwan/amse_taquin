import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exercice2_Page extends StatefulWidget{
  Exercice2_Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Exercice2_Page createState() => _Exercice2_Page();
}

class _Exercice2_Page extends State<Exercice2_Page>{
  double _rot_x = 0;
  double _rot_z = 0;
  double _scale = 100;
  bool _mirror = false;
  final pi = 3.1415926535897932;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Transform(
                  child: Image(image: NetworkImage('https://picsum.photos/512')),
                  alignment: FractionalOffset.center,
                  transform: Matrix4(
                    1, 0, 0, 0,
                    0, 1, 0, 0,
                    0, 0, 1, 0,
                    0, 0, 0, 1 / (_scale/100),
                  )
                    ..rotateX(pi / 180 * _rot_x)
                    ..rotateY(_mirror ? pi : 0)
                    ..rotateZ(pi / 180 * _rot_z)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Rotation X :", style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(
                  child: Slider(
                    min: 0,
                    max: 360,
                    divisions: 100,
                    value: _rot_x,
                    onChanged: (double value){
                      setState(() {
                        _rot_x = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Rotation Z :", style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(
                  child: Slider(
                    min: 0,
                    max: 360,
                    divisions: 100,
                    value: _rot_z,
                    onChanged: (double value){
                      setState(() {
                        _rot_z = value;
                      });
                    }
                  )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Miroir :", style: TextStyle(fontWeight: FontWeight.bold)),
                Checkbox(
                  value: _mirror,
                  onChanged: (bool value) {
                    setState(() {
                      _mirror = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Scale :", style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(
                  child: Slider(
                    min: 50,
                    max: 150,
                    divisions: 100,
                    value: _scale,
                    onChanged: (double value){
                      setState(() {
                        _scale = value;
                      });
                    }
                  ),
                )
              ],
            )
          ],
        ),
      ) ,
    );
  }

}