import 'dart:convert';
import 'package:flutter_thing/coordspage.dart';
import 'package:flutter_thing/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class citypage extends StatefulWidget {
  citypage();
  @override
  State<citypage> createState() => _citypageState();
}

class _citypageState extends State<citypage> {
  final _citycon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    String city='Berlin';
    var a,b,c,d,e,f;
    Future APIcall() async {
      var url = Uri.parse("https://api.openweathermap.org/data/2.5/"
          "weather?q="+city+"Berlin&appid=76cd3acdfd42c1d5824cdd626fa34ac8&units=metric");
      final response=await http.get(url);
      final json= jsonDecode(response.body);
      //return json;
      a = "Weather: " + json.data['weather'][0]['description'].toString();
      b = "Temperature: " + json.data['main']['temp'].toString() + " degrees Celcius";
      c = "Visibility: " + json.data['visibility'].toString() + " metres".toString();
      d="Latitude: "+json.data['coord']['lat'].toString();
      e="Longitude: "+json.data['coord']['lon'].toString();
      f="http://openweathermap.org/img/wn/"+json.data['weather'][0]['icon']+"@2x.png";
    }
    xx({required x}){
      city=x;
    }
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
                    TextField(controller: _citycon,
                      onChanged: (text) {xx(x:text);},showCursor: true,style: TextStyle(
                      color: Colors.black,fontStyle: FontStyle.italic,fontSize: 25,
                    ),decoration: InputDecoration(hintText:"City name:",fillColor: Colors.white,filled: true),
                    ),),
                  ElevatedButton(onPressed: (){city=_citycon.text;},
                      child: Text("Input Co-ordinates",style: TextStyle(
                          fontSize: 20,fontStyle: FontStyle.italic)
                      ),style:ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.white),
                          foregroundColor: MaterialStatePropertyAll(Colors.black)
                      ),)
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
              )]

          )
    );
  }
}