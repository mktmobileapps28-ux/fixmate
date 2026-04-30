import 'package:flutter/material.dart';
import 'booking_screen.dart';

class ElectricianScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Electrician Services")),
      body: Column(
        children: [
          Image.asset('assets/electracian.jpg', height: 200, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Expert Wiring & Repair", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text("Rs. 800 (Visit Fee)", style: TextStyle(fontSize: 20, color: Color(0xFF673AB7), fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Short circuit fixing, fan installation, and new wiring services available."),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF673AB7), minimumSize: Size(double.infinity, 55)),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen())),
              child: Text("Book Electrician", style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}