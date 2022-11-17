import 'dart:convert';
import 'package:flutter_thing/coordspage.dart';
import 'package:flutter_thing/citypage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thing/ratingspage.dart';
import 'package:http/http.dart' as http;

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
  final _citycon1=TextEditingController();
  final _citycon2=TextEditingController();
  final _citycon3=TextEditingController();
  @override
  xx1({required x}){
    city=x;
  }
  xx2({required x}){
    lat=x;
  }
  xx3({required x}){
    lon=x;
  }
  gotocity(){
    Navigator.push(context,MaterialPageRoute(
        builder: (context)=>citypage(
            A:a,B:b,C:c,D:d,E:e,F:f
        )
    ));
  }
  gotocoords(){
    Navigator.push(context,MaterialPageRoute(
        builder: (context)=>coordspage(
            A:a,B:b,C:c,D:d,E:e,F:f
        )
    ));
  }
  gotoratings(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>ratingbar()));
  }
  String city='';
  var lat='0';
  var lon='0';
  Future APIcall_city() async {
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=76cd3acdfd42c1d5824cdd626fa34ac8&units=metric");
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    a= "Weather: " + json['weather'][0]['description'].toString();
    b = "Temperature: " + json['main']['temp'].toString() + " degrees Celcius";
    c = "Visibility: " + json['visibility'].toString() + " metres".toString();
    d="Latitude: "+json['coord']['lat'].toString();
    e="Longitude: "+json['coord']['lon'].toString();
    f="http://openweathermap.org/img/wn/"+json['weather'][0]['icon']+"@2x.png";
  }
  Future APIcall_coords() async {
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&appid=76cd3acdfd42c1d5824cdd626fa34ac8");
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    a= "Weather: " + json['weather'][0]['description'].toString();
    b = "Temperature: " + json['main']['temp'].toString() + " degrees Celcius";
    c = "Visibility: " + json['visibility'].toString() + " metres".toString();
    d="Latitude: "+json['coord']['lat'].toString();
    e="Longitude: "+json['coord']['lon'].toString();
    f="http://openweathermap.org/img/wn/"+json['weather'][0]['icon']+"@2x.png";
  }
  var a,b,c,d,e,f;
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
            Container(height: 200,width: 200,child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
            ],),),
            ElevatedButton(onPressed: gotoratings,
              child: Text("        Rate Us!!!       ",style:
              TextStyle(fontSize: 20,fontStyle: FontStyle.italic)
            ),style:ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber),
                foregroundColor: MaterialStatePropertyAll(Colors.black)
            ),)
          ],
        ),
            Container(height: 200,width: 200,child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height:46,width:250,child:
                      TextField(controller: _citycon1,
                        onChanged: (text) {xx1(x:text);},showCursor: true,style: TextStyle(
                          color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25,
                        ),decoration: InputDecoration(hintText:"City name:",fillColor: Colors.white,filled: true),
                      ),),
                      ElevatedButton(onPressed: APIcall_city,
                        child: Text("SUBMIT",),style:ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.amber),
                            foregroundColor: MaterialStatePropertyAll(Colors.black)
                        ),)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height:46,width:250,child:
                          TextField(controller: _citycon2,
                            onChanged: (text1) {xx2(x:text1);},showCursor: true,style: TextStyle(
                              color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25,
                            ),decoration: InputDecoration(hintText:"Latitude:",fillColor: Colors.white,filled: true),
                          ),),
                          Container(height:50,width:250,child:
                          TextField(controller: _citycon3,
                            onChanged: (text2) {xx3(x:text2);},showCursor: true,style: TextStyle(
                              color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25,
                            ),decoration: InputDecoration(hintText:"Longitude:",fillColor: Colors.white,filled: true),
                          ),),
                        ],
                      ),
                      ElevatedButton(onPressed: APIcall_coords,
                        child: Text("SUBMIT")
                        ,style:ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.amber),
                            foregroundColor: MaterialStatePropertyAll(Colors.black)
                        ),)
                    ],
                  )
                ])),
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