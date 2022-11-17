import 'dart:convert';
import 'package:flutter_thing/coordspage.dart';
import 'package:flutter_thing/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class citypage extends StatefulWidget {
  citypage({required this.A,this.B,this.C,this.D,this.E,this.F});
  var A,B,C,D,E,F;
  @override
  State<citypage> createState() => _citypageState();
}

class _citypageState extends State<citypage> {
  @override
  Widget build(BuildContext context) {
    var a=widget.A;
    var b=widget.B;
    var c=widget.C;
    var d=widget.D;
    var e=widget.E;
    var f=widget.F;
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather App",style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children:[
              Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        Text(a,style: TextStyle(
                            fontSize: 28,color: Colors.white,fontStyle: FontStyle.italic
                        ),),
                        Text(b,style: TextStyle(
                            fontStyle: FontStyle.italic,fontSize: 28,color: Colors.white
                        ),),
                        Text(c,style: TextStyle(
                            fontSize: 28,color: Colors.white,fontStyle: FontStyle.italic
                        ),),
                        Text(d,style: TextStyle(
                            fontSize: 28,color: Colors.white,fontStyle: FontStyle.italic
                        ),),
                        Text(e,style: TextStyle(
                            fontSize: 28,color: Colors.white,fontStyle: FontStyle.italic
                        )),
                        Container(height: 100,width: 100,child: Image.network(f),
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                        )
                      ]
                  )

              ]

          )
    );
  }
}