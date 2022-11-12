import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class coordspage extends StatefulWidget {
  coordspage();
  @override
  State<coordspage> createState() => _coordspageState();
}

class _coordspageState extends State<coordspage> {
  @override
  var lat='0';
  var lon='0';
  xa({required x}){
    lat=x;
  }
  xb({required x}){
    lon=x;
  }
  Future APIcall() async {
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/onecall?"
        "lat="+lat+
        "&lon="+lon+
        "&exclude=hourly,daily&"
        "appid=3ffeeecbf5d2aabcd2d01ed0a0999871");
    final response=await http.get(url);
    final json= jsonDecode(response.body);
    return json;
  }
  Widget build(BuildContext context) {
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
              Padding(padding: EdgeInsets.all(16.0),
                  child: Column(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [Container(height:75,width:250,child:
                  TextField(onChanged: (text) {xa(x:text);},showCursor: true,style: TextStyle(
                    color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25,
                  ),decoration: InputDecoration(hintText:"Latitude:",fillColor: Colors.white,filled: true),
                  )),Container(height:75,width:250,child:
                  TextField(onChanged: (text) {xb(x:text);},showCursor: true,style: TextStyle(
                    color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25,
                  ),decoration: InputDecoration(hintText:"Longitude:",fillColor: Colors.white,filled: true),
                  )),
                  ]
                  )
              ),
              FutureBuilder(future: APIcall(),builder: (context,snapshot){
                if (snapshot.hasData){
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        Text("Weather: "+snapshot.data['weather'][0]['description'].toString(),style: TextStyle(
                            fontSize: 28,color: Colors.white,fontStyle: FontStyle.italic
                        ),),
                        Text("Temperature: "+snapshot.data['main']['temp'].toString()+" degrees Celcius",style: TextStyle(
                            fontStyle: FontStyle.italic,fontSize: 28,color: Colors.white
                        ),),
                        Text("Visibility: "+snapshot.data['visibility'].toString()+" metres",style: TextStyle(
                            fontSize: 28,color: Colors.white,fontStyle: FontStyle.italic
                        ),),
                        Text("Latitude: "+snapshot.data['coord']['lat'].toString(),style: TextStyle(
                            fontSize: 28,color: Colors.white,fontStyle: FontStyle.italic
                        ),),
                        Text("Longitude : "+snapshot.data['coord']['lon'].toString(),style: TextStyle(
                            fontSize: 28,color: Colors.white,fontStyle: FontStyle.italic
                        )),
                        Container(height: 100,width: 100,child: Image.network(
                            "http://openweathermap.org/img/wn/"+snapshot.data['weather'][0]['icon']+"@2x.png"),
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                        )
                      ]
                  );
                }else {
                  return CircularProgressIndicator();
                }
              }
              )
            ]
        )
    );
  }
}