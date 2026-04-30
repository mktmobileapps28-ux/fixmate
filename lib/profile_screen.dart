import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF673AB7),
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          Text("User Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          ListTile(leading: Icon(Icons.settings), title: Text("Account Settings")),
          ListTile(leading: Icon(Icons.help_outline), title: Text("Help Center")),
          ListTile(leading: Icon(Icons.logout, color: Colors.red), title: Text("Logout", style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}