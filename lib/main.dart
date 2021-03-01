import 'package:flutter/material.dart';
import 'package:amse_taquin/exercice2.dart';
import 'package:amse_taquin/exercice2b.dart';
import 'package:amse_taquin/exercice4.dart';
import 'package:amse_taquin/exercice5a.dart';
import 'package:amse_taquin/exercice5b.dart';
import 'package:amse_taquin/exercice5c.dart';
import 'package:amse_taquin/exercice6a.dart';
import 'package:amse_taquin/exercice6b.dart';
import 'package:amse_taquin/exercice7.dart';

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
          Card(child:
            ListTile(
              title: Text('Exercice 5a'),
              subtitle: Text('Plateau de tuiles - Couleurs'),
              trailing: Icon(Icons.play_arrow_rounded),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice5a_Page(title: "Plateau de tuiles - Couleurs"))),
            ),
          ),
          Card(child:
            ListTile(
              title: Text('Exercice 5b'),
              subtitle: Text('Plateau de tuiles - Image'),
              trailing: Icon(Icons.play_arrow_rounded),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice5b_Page(title: "Plateau de tuiles - Image"))),
            ),
          ),
          Card(child:
            ListTile(
              title: Text('Exercice 5c'),
              subtitle: Text('Plateau de tuiles modifiable'),
              trailing: Icon(Icons.play_arrow_rounded),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice5c_Page(title: "Plateau de tuiles modifiable"))),
            ),
          ),
          Card(child:
            ListTile(
              title: Text('Exercice 6a'),
              subtitle: Text('Echange de tiles'),
              trailing: Icon(Icons.play_arrow_rounded),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice6a_Page(title: "Echange de tiles"))),
            ),
          ),
          Card(child:
            ListTile(
              title: Text('Exercice 6b'),
              subtitle: Text('Echange de tiles dans grille'),
              trailing: Icon(Icons.play_arrow_rounded),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice6b_Page(title: "Echange de tiles dans grilles"))),
            ),
          ),
          Card(child:
            ListTile(
              title: Text('Exercice 7'),
              subtitle: Text('Jeu du Taquin'),
              trailing: Icon(Icons.play_arrow_rounded),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Exercice7(title: "Taquin"))),
            ),
          ),
        ],
      )
    );
  }
}
