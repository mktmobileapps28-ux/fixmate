import 'package:flutter/material.dart';
import 'customer_home_screen.dart';

class CitySelectionScreen extends StatelessWidget {
  final List<String> cities = ["Lahore", "Karachi", "Islamabad", "Faisalabad", "Multan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Your City", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search your city...",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: cities.length,
              separatorBuilder: (context, index) => Divider(height: 1),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.location_on_outlined, color: Color(0xFF673AB7)),
                  title: Text(cities[index], style: TextStyle(fontWeight: FontWeight.w500)),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // City select karne ke baad Home par bhej dega
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomerHomeScreen()));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}