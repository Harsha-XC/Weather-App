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
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 230,width: 200,
                  child: Image.network("https://media.istockphoto.com/id/531889697/photo/weather-forecast-concept.jpg?b=1&s=170667a&w=0&k=20&c=Jci9nrgcCSfOx8ZgfO9KbMKr3r0i28B1fwN20r8KmFA=")),
              Container(height: 230,width: 200,
                  child: Image.network("https://images.unsplash.com/photo-1504608524841-42fe6f032b4b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHdlYXRoZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60")),
            ],
          ),
        Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            Text("MAIN MENU:",style:TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28
            ),
            ),
            ElevatedButton(onPressed:gotocity,
                child: Text("       Input City       ",style: TextStyle(
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
                child: Text("        Input City         ",style: TextStyle(
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
            ElevatedButton(onPressed: gotoratings,child: Text("        Rate Us!!!       ",style: TextStyle(
                fontSize: 20,fontStyle: FontStyle.italic)
            ),style:ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber),
                foregroundColor: MaterialStatePropertyAll(Colors.black)
            ),)
          ],
        ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 230,width: 200,
                  child: Image.network(
                  'https://images.unsplash.com/photo-1584267385494-9fdd9a71ad75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8d2VhdGhlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'
                )),
                Container(height: 230,width: 200,
                    child: Image.network(
                        "https://images.unsplash.com/photo-1454789476662-53eb23ba5907?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d2VhdGhlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"
                    )),
              ],
            )
      ]
      )
    );
  }
}