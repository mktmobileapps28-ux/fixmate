import 'package:flutter/material.dart';
import 'provider_dashboard.dart';

class ProviderSetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setup Profile", style: TextStyle(color: Colors.black)), backgroundColor: Colors.white, elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            CircleAvatar(radius: 40, backgroundColor: Color(0xFFF4F0FF), child: Icon(Icons.camera_alt, color: Color(0xFF673AB7))),
            SizedBox(height: 30),
            buildField("Full Name"),
            buildField("Email"),
            buildField("Contact"),
            buildField("Experience (Years)"),
            buildField("City"),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF673AB7), minimumSize: Size(double.infinity, 55), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProviderDashboard())),
              child: Text("Finish Setup", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
  Widget buildField(String label) => Padding(padding: EdgeInsets.only(bottom: 15), child: TextField(decoration: InputDecoration(labelText: label, filled: true, fillColor: Color(0xFFF5F5F5), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))));
}