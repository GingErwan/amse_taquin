import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exercice2b_Page extends StatefulWidget{
  Exercice2b_Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Exercice2b_Page createState() => _Exercice2b_Page();
}

class _Exercice2b_Page extends State<Exercice2b_Page> {

  double _rot_x = 0;
  double _rot_z = 0;
  double _scale = 100;
  double incr_sc = 0.5;
  bool _mirror = false;
  bool launch_anim = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        setState(() {
          launch_anim = false;
        });
        Navigator.pop(context);
      },
      child: Scaffold(
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
                      ..rotateX(math.pi / 180 * _rot_x)
                      ..rotateY(_mirror ? math.pi : 0)
                      ..rotateZ(math.pi / 180 * _rot_z)
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
        ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              launch_anim = !launch_anim;
              const d = const Duration(milliseconds: 50);
              new Timer.periodic(d, animate);
            },
            tooltip: 'Launch',
            child: Icon(!launch_anim ? Icons.play_arrow_rounded : Icons.pause),
          ),
      )
    );
  }

  void animate(Timer t){
    setState(() {
      _rot_x <= 350 ? _rot_x += 0.5 : _rot_x = 0;
      _rot_z <= 350 ? _rot_z += 2 : _rot_z = 0;
      _scale += incr_sc;
      if(_scale > 140 || _scale < 60){incr_sc = -incr_sc;}
    });

    if (!launch_anim){t.cancel();}
  }
}