import 'dart:convert';
import 'package:flutter_thing/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class citypage extends StatefulWidget {
  citypage();

  @override
  State<citypage> createState() => _citypageState();
}

class _citypageState extends State<citypage> {
  @override
  String city='';
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather App",style: TextStyle(color: Colors.grey),),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body:Column(children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              FutureBuilder(future: APIcall(),builder: (context,snapshot){
                if (snapshot.hasData){
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Text("Weather: "+snapshot.data['weather'][0]['description'].toString(),style: TextStyle(
                          fontSize: 28,color: Colors.white,fontStyle: FontStyle.italic
                        ),),
                        Text("Temperature: "+snapshot.data['main']['temp'].toString()+" degrees Celcius",style: TextStyle(
                          fontStyle: FontStyle.italic,fontSize: 28,color: Colors.white
                        ),),
                        Container(height: 100,width: 100,child: Image.network("http://openweathermap.org/img/wn/10d@2x.png"),)
                      ]
                  );
                }else {
                  return CircularProgressIndicator();
                }
              }
              )
            ]
          )
        ]
        )
    );
  }
}

Future APIcall() async {
  var url = Uri.parse("https://api.openweathermap.org/data/2.5/"
      "weather?q=Berlin&appid=3ffeeecbf5d2aabcd2d01ed0a0999871&units=metric");
  final response=await http.get(url);
  final json= jsonDecode(response.body);
  return json;
}