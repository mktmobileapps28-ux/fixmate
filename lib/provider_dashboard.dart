import 'package:flutter/material.dart';

class ProviderDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Color(0xFF673AB7),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            // TOP STATS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard("Earnings", "Rs. 25,000"),
                _buildStatCard("Orders", "120"),
                _buildStatCard("Pending", "8"),
              ],
            ),

            SizedBox(height: 20),

            // LIST
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text("New Request: AC Repair"),
                    subtitle: Text("Customer: Ahmed - Gulberg"),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: Text("Accept"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // REUSABLE CARD WIDGET
  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(0xFF673AB7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(title, style: TextStyle(color: Colors.white70)),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}