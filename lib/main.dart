import 'dart:convert';
import 'package:flutter_thing/coordspage.dart';
import 'package:flutter_thing/citypage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thing/ratingspage.dart';

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
  gotocity1(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>citypage()));
  }
  gotocoords1(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>coordspage()));
  }
  gotoratings(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>ratingbar()));
  }
  String city='';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body:Row(
        mainAxisAlignment:MainAxisAlignment.center,
          children: [
        Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            Text("Choose Input Option:",style:TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontSize: 28
            ),
            ),
            ElevatedButton(onPressed:gotocity,
                child: Text("Input City",style: TextStyle(
                    fontSize: 20,fontStyle: FontStyle.italic)
                ),style:ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                foregroundColor: MaterialStatePropertyAll(Colors.black)
              ),
            ),
            ElevatedButton(onPressed: gotocoords,
                child: Text("Input Co-ordinates",style: TextStyle(
                  fontSize: 20,fontStyle: FontStyle.italic)
                  ),style:ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  foregroundColor: MaterialStatePropertyAll(Colors.black)
              ),
            ),
            ElevatedButton(onPressed: gotocity1,
                child: Text("Input City",style: TextStyle(
                    fontSize: 20,fontStyle: FontStyle.italic)
                ),style:ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  foregroundColor: MaterialStatePropertyAll(Colors.black)
              ),),
            ElevatedButton(onPressed: gotocoords1,
                child: Text("Input Co-ordinates",style: TextStyle(
                    fontSize: 20,fontStyle: FontStyle.italic)
                ),style:ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                  foregroundColor: MaterialStatePropertyAll(Colors.black)
              ),),
            ElevatedButton(onPressed: gotoratings,child: Text("Rate Us!!!",style: TextStyle(
                fontSize: 20,fontStyle: FontStyle.italic)
            ),style:ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                foregroundColor: MaterialStatePropertyAll(Colors.black)
            ),)
          ],
        )
      ]
      )
    );
  }
}