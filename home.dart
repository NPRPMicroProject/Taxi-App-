import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    TextEditingController phoneNumberController =
        TextEditingController(); // Add a controller to manage the text field value
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          width: double.infinity,
          height: 200,
          child: Image.asset('assets/taxi.png'),
        ),
        Text(
          "E-hailing Service",
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Welcome! Take  a ride to your destination with the cheapest fare",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 50,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextField(
              controller:
                  phoneNumberController, // Assign the controller to the TextField
              decoration: InputDecoration(
                hintText:
                    "enter your phone.no", // Provide a hint for the desired phone number format
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          height: 70,
        ),
        GestureDetector(
          onTap: () {
            // You can access the phone number using phoneNumberController.text
            // For example, you can print it like this:
            print("Phone number entered: ${phoneNumberController.text}");
            // Navigate to booking screen or perform other actions here
            Navigator.of(context).pushNamed('/booking');
          },
          child: Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.amber[600],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                "Book a ride",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text("More", style: TextStyle(color: Colors.blue))
      ],
    );
  }
}
