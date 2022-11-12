import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
class ratingbar extends StatefulWidget {
  ratingbar();

  @override
  State<ratingbar> createState() => _ratingbarState();
}

class _ratingbarState extends State<ratingbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App",style: TextStyle(
          color: Colors.black,fontSize: 28,fontStyle: FontStyle.italic
        ),),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.black,
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Container(height: 250,width: 250,child: Image.network(
          "https://as1.ftcdn.net/v2/jpg/02/18/35/04/1000_F_218350435_ApUDYtIChOJWneiXEvW8fUrmzNpRTc7T.jpg"
        ),),
          RatingBar.builder(
            initialRating: 5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Text("Thanks for giving us your valuable feedback",style: TextStyle(
              color: Colors.white,fontSize: 28,fontStyle: FontStyle.italic
          ),),
        ],
      )
        ,),
    );
  }
}
