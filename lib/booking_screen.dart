import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Service", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Date", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  dateChip("Mon", "24", true),
                  dateChip("Tue", "25", false),
                  dateChip("Wed", "26", false),
                  dateChip("Thu", "27", false),
                  dateChip("Fri", "28", false),
                ],
              ),
            ),

            SizedBox(height: 30),
            Text("Select Time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                timeChip("10:00 AM", true),
                timeChip("12:00 PM", false),
                timeChip("02:00 PM", false),
                timeChip("04:00 PM", false),
                timeChip("06:00 PM", false),
              ],
            ),

            SizedBox(height: 30),
            Text("Address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFF673AB7)),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("123 Main Street, Johar Town, Lahore", style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),

            SizedBox(height: 30),
            Text("Additional Notes (Optional)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Tell us about the issue...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF673AB7),
                minimumSize: Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                // Show Confirmation
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Booking Confirmed!")));
              },
              child: Text("Confirm Booking", style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            Center(child: TextButton(onPressed: (){}, child: Text("You can track your booking in real-time", style: TextStyle(color: Colors.grey, fontSize: 12)))),
          ],
        ),
      ),
    );
  }

  Widget dateChip(String day, String date, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF673AB7) : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(day, style: TextStyle(color: isSelected ? Colors.white : Colors.grey)),
          Text(date, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
    );
  }

  Widget timeChip(String time, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF673AB7) : Colors.white,
        border: Border.all(color: isSelected ? Colors.transparent : Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(time, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
    );
  }
}