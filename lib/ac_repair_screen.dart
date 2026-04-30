import 'package:flutter/material.dart';
import 'booking_screen.dart';

class ACRepairScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AC Repair Services")),
      body: Column(
        children: [
          Image.asset('assets/ac.jpg', height: 200, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Professional AC Service", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text("Rs. 2,500", style: TextStyle(fontSize: 20, color: Color(0xFF673AB7), fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Includes gas charging, filter cleaning, and full outdoor/indoor service."),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF673AB7), minimumSize: Size(double.infinity, 55)),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen())),
              child: Text("Book AC Repair", style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}