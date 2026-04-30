import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                "assets/onpic.png",height: 250,
            ),
            // Replace with your asset
            Text("Find Trusted Services", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("Connect with verified professionals for any job at your doorstep.", textAlign: TextAlign.center),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF673AB7), minimumSize: Size(double.infinity, 50)),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
              child: Text("Next", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}