import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void writeFile(String fileName, String content) async {
  try {
    // Get the directory where the application may place data that is user-generated.
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/$fileName');

    // Write the file
    await file.writeAsString(content);
    print('File written successfully at $path/$fileName');
  } catch (e) {
    print('Error writing to the file: $e');
  }
}

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  void confirmBookingAndSaveData() {
    final fromText = _fromController.text;
    final toText = _toController.text;
    final data = 'From: $fromText\nTo: $toText';

    // No need to provide a path here, just the file name
    writeFile('data.txt', data);

    Navigator.of(context).pushNamed('/paymentMethod');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        backgroundColor: Colors.amber[600],
        elevation: 0,
        toolbarHeight: 60,
      ),
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            locationInputField("From?", _fromController, false),
            SizedBox(height: 20),
            locationInputField("To?", _toController, false),
            SizedBox(height: 20),

            // Continue with other pre-populated locations...
            SizedBox(height: 40),
            GestureDetector(
              onTap: confirmBookingAndSaveData,
              child: Container(
                height: 40,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.amber[600],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Confirm booking",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget locationInputField(
      String title, TextEditingController? controller, bool isHistory) {
    return Container(
      height: 60,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3)),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            isHistory ? Icons.location_on : Icons.location_searching_outlined,
            color: isHistory
                ? Colors.green
                : title.contains('From')
                    ? Colors.grey
                    : const Color.fromARGB(255, 35, 148, 240),
          ),
          hintText: title,
          contentPadding: EdgeInsets.only(left: 20.0),
        ),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
