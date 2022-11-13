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
  var lat='44.34';
  var lon='10.99';
  xa({required x}){
    lat=x;
  }
  xb({required x}){
    lon=x;
  }

  Future APIcall() async {
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/onecall?"
        "lat=" + lat +
        "&lon=" + lon +
        "&appid=76cd3acdfd42c1d5824cdd626fa34ac8");
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    print(json);
    //return json;

    a = "Weather: " + json.data['weather'][0]['description'].toString();
    b = "Temperature: " + json.data['main']['temp'].toString() + " degrees Celcius";
    c = "Visibility: " + json.data['visibility'].toString() + " metres".toString();
    d="Latitude: "+json.data['coord']['lat'].toString();
    e="Longitude: "+json.data['coord']['lon'].toString();
    f="http://openweathermap.org/img/wn/"+json.data['weather'][0]['icon']+"@2x.png";
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
        body: Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children:[
              Padding(padding: EdgeInsets.all(16.0),
                  child: Column(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                    Container(height:75,width:250,child:
                    TextField(onSubmitted: (text) {xa(x:text);},showCursor: true,style: TextStyle(
                      color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25,
                    ),decoration: InputDecoration(hintText:"Latitude:",fillColor: Colors.white,filled: true),
                    )),
                    Container(height:75,width:250,child:
                    TextField(onSubmitted: (text) {xb(x:text);},showCursor: true,style: TextStyle(
                      color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25,
                    ),decoration: InputDecoration(hintText:"Longitude:",fillColor: Colors.white,filled: true),
                    )),
                    ElevatedButton(onPressed: APIcall, child: Text("Find the weather",style: TextStyle(
                      fontStyle: FontStyle.italic,fontSize: 28,
                    )
                    ),style: ButtonStyle(
                        foregroundColor:MaterialStatePropertyAll(Colors.black),
                      backgroundColor: MaterialStatePropertyAll(Colors.white)
                    ),
                    )
                  ]
                  )
              ),
              FutureBuilder(future: APIcall(),builder: (context,snapshot){
                if (snapshot.hasData){
                  return Column(
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