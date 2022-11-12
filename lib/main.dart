import 'dart:convert';
import 'package:flutter_thing/coordspage.dart';
import 'package:flutter_thing/citypage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: APIthing()
    );
  }
}

class APIthing extends StatefulWidget {
  const APIthing({Key? key}) : super(key: key);

  @override
  State<APIthing> createState() => _APIthingState();
}

class _APIthingState extends State<APIthing> {
  @override
  gotocity(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>citypage()));
  }
  gotocoords(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>coordspage()));
  }
  String city='';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App",style: TextStyle(color: Colors.grey),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body:Row(
        mainAxisAlignment:MainAxisAlignment.center,
          children: [
        Column(
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
            Text("Choose Input Option:",style:TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontSize: 28
            ),
            ),
            ElevatedButton(onPressed:gotocity,
                child: Text("Input City")),
            ElevatedButton(onPressed: gotocoords, child: Text("Input Co-ordinates"))
          ],
        )
      ]
      )
    );
  }
}