import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:real_taxi/shared_widgets.dart'; // Ensure this path matches where you actually store your shared widgets

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    readFileAndSetLocations();
  }

  Future<void> readFileAndSetLocations() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/data.txt');
      String text = await file.readAsString();
      List<String> lines = text.split('\n');
      if (lines.length >= 2) {
        _fromController.text =
            lines[0].substring(6); // Assumes the format "From: <location>"
        _toController.text =
            lines[1].substring(4); // Assumes the format "To: <location>"
      }
    } catch (e) {
      print('Error reading file: $e');
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Summary"),
        backgroundColor: Colors.amber[600],
        elevation: 0,
        toolbarHeight: 60,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : content(context),
    );
  }

  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.amber[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Image.asset('assets/taxi.png', width: 160, height: 160),
                Text("\₹200"),
              ],
            ),
          ),
          SizedBox(height: 20),
          locationInputField("From", _fromController, false),
          Text("|\n|"),
          locationInputField("To", _toController, false),
          SizedBox(height: 50),
          ElevatedButton.icon(
            icon: const Icon(EvaIcons.phoneCall),
            label: const Text('Call Driver'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 19, 233, 36)),
            ),
            onPressed: () async {
              final Uri url = Uri(scheme: 'tel', path: "+91 8547722860");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                print('Cannot launch the call');
              }
            },
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/call'),
            child: Container(
              height: 45,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.amber[600],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
