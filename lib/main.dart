import 'package:flutter/material.dart';
import 'package:amse_taquin/exercice2.dart';
import 'package:amse_taquin/exercice2b.dart';
import 'package:amse_taquin/exercice4.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'TP2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Card(child:
            ListTile(
              title: Text('Exercice 2'),
              subtitle: Text('Transformation image'),
              trailing: Icon(Icons.play_arrow_rounded),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice2_Page(title: "Transformation image"))),
            ),
          ),
          Card(child:
            ListTile(
              title: Text('Exercice 2b'),
              subtitle: Text('Animation image'),
              trailing: Icon(Icons.play_arrow_rounded),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice2b_Page(title: "Animation image"))),
            ),
          ),
          Card(child:
            ListTile(
              title: Text('Exercice 4'),
              subtitle: Text('Récupération tile'),
              trailing: Icon(Icons.play_arrow_rounded),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice4_Page(title: "Récupération tile"))),
            ),
          ),
        ],
      )
    );
  }
}
