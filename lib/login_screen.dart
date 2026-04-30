import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'role_selection_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 1. Form Key banai validation check karne ke liye
  final _formKey = GlobalKey<FormState>();

  // Controllers text handle karne ke liye
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Validation function
  void _submitData() {
    if (_formKey.currentState!.validate()) {
      // Agar validation pass ho gayi to next screen pe jao
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RoleSelectionScreen())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 60),
          // 2. Pure UI ko Form widget mein wrap kiya
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Welcome Back! 👋", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
                SizedBox(height: 10),
                Center(child: Text("Login to your account", style: TextStyle(color: Colors.grey))),
                SizedBox(height: 40),

                Text("Email or Phone", style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(height: 8),
                // 3. TextFormField use kiya validation ke liye
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: "Enter email or phone",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email or phone';
                    }
                    if (value.contains('@') && !value.contains('.')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),
                Text("Password", style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter password",
                      suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: (){},
                        child: Text("Forgot Password?", style: TextStyle(color: Color(0xFF673AB7)))
                    )
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF673AB7),
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                  ),
                  onPressed: _submitData, // Call validation function
                  child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),

                SizedBox(height: 20),
                Center(child: Text("OR", style: TextStyle(color: Colors.grey))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen())),
                      child: Text("Sign Up", style: TextStyle(color: Color(0xFF673AB7), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}