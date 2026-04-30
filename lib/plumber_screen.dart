import 'package:flutter/material.dart';
import 'booking_screen.dart';

class PlumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Plumbing Services")),
      body: Column(
        children: [
          Image.network('https://img.freepik.com/free-photo/plumber-fixing-sink-kitchen_23-2148184517.jpg', height: 200, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Water Leakage & Pipes", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text("Rs. 1,000", style: TextStyle(fontSize: 20, color: Color(0xFF673AB7), fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Complete bathroom fitting, kitchen sink repair, and water tank cleaning."),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF673AB7), minimumSize: Size(double.infinity, 55)),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen())),
              child: Text("Book Plumber", style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}