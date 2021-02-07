import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class Area{
int index;
String name;
Color color;
Area({this.index: -1,this.name: "Area",this.color: Colors.lightBlueAccent});

}

class _State extends State<MyApp> {
  int _location;
  List<Area> _areas;

  @override
  void initState() {
    // TODO: implement initState
    _areas = List<Area>();
    for(int i=0;i< 16;i++ ){
      _areas.add(Area(index: i,name: "Area{$i}"));
    }

    var rng = Random();
    _location = rng.nextInt(_areas.length);
  }

  Widget _generaate(int index){
    return GridTile(child: Container(
     padding: EdgeInsets.all(5.00),
      child: RaisedButton(
        color: _areas[index].color,
        onPressed: () => _onPressed(index),
        child: Text(_areas[index].name,textAlign: TextAlign.center,),
      ),
     )
    );
  }

  void _onPressed(int index){
    setState(() {
      if(index == _location){
        _areas[index].color = Colors.green;
        }
      else
        {
          _areas[index].color = Colors.red;
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam 14'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: GridView.count(
            crossAxisCount: 4,
          children: List<Widget>.generate(16, _generaate),
        )
      ),
    );
  }
}