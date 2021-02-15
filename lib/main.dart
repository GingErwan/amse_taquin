import 'package:flutter/material.dart';
import 'package:amse_taquin/exercice2.dart';

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
  int _counter = 0;

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
        ],
      )
    );
  }
}
