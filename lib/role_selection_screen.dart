import 'package:flutter/material.dart';
import 'city_selection.dart';
import 'provider_setup.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Your Role", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1A1D1E))),
            SizedBox(height: 8),
            Text("Choose how you want to continue", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 40),

            // Customer Card
            roleCard(
                context,
                "I'm a Customer",
                "I want to book services",
                Icons.person_outline,
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => CitySelectionScreen()))
            ),

            SizedBox(height: 20),

            // Provider Card
            roleCard(
                context,
                "I'm a Service Provider",
                "I want to offer services",
                Icons.handyman_outlined,
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderSetupScreen()))
            ),
          ],
        ),
      ),
    );
  }

  Widget roleCard(BuildContext context, String title, String sub, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFEEEEEE), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xFFEEEEEE),
              child: Icon(icon, color: Color(0xFF673AB7)),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(sub, style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}