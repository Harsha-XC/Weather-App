import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class coordspage extends StatefulWidget {
  coordspage();

  @override
  State<coordspage> createState() => _coordspageState();
}

class _coordspageState extends State<coordspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.grey,
        title:Text("Weather App"),
        centerTitle: true
      ),
      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
            ],
          )
       ],
      )
    );
  }
}
