import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Call extends StatelessWidget {
  const Call({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating"),
        backgroundColor: Colors.amber[600],
        elevation: 0,
        toolbarHeight: 60,
        actions: [
          Icon(Icons.settings),
          SizedBox(width: 20),
        ],
      ),
      body: Center(
        // Center the content vertically and horizontally
        child: content(),
      ),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Align column to center
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: Image.asset('assets/taxi_1.png'),
          ),
          Text(
            "Rate your last ride:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          RatingBar.builder(
            initialRating: 0,
            itemPadding: const EdgeInsets.all(10),
            itemCount: 5,
            itemBuilder: (context, index) => Icon(
              EvaIcons.star,
              color: Colors.yellow,
            ),
            onRatingUpdate: (value) {
              // Handle rating update
            },
          ),
        ],
      ),
    );
  }
}
