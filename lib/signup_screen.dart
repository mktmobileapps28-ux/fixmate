import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // 1. Form Key aur Controllers
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  bool _isObscure = true;
  bool _isConfirmObscure = true;

  // 2. Submit Logic
  void _validateAndSignUp() {
    if (_formKey.currentState!.validate()) {
      // Agar sab sahi hai to yahan API call ya navigation karein
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Processing Data..."), backgroundColor: Color(0xFF673AB7)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 60),
          child: Form(
            key: _formKey, // 3. Form wrap kiya
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                Text("Join FixMate today", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 30),

                // Name Field
                buildLabel("Full Name"),
                TextFormField(
                  controller: _nameController,
                  decoration: inputDecoration("Enter your full name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Please enter your name";
                    if (value.length < 3) return "Name is too short";
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Email Field
                buildLabel("Email or Phone"),
                TextFormField(
                  controller: _emailController,
                  decoration: inputDecoration("Enter email or phone"),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Field cannot be empty";
                    // Simple Email/Phone regex check
                    if (!RegExp(r'^[0-9]+$').hasMatch(value) && !value.contains('@')) {
                      return "Enter a valid email or phone number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Password Field
                buildLabel("Password"),
                TextFormField(
                  controller: _passController,
                  obscureText: _isObscure,
                  decoration: inputDecoration("Create password").copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => setState(() => _isObscure = !_isObscure),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Password is required";
                    if (value.length < 6) return "Password must be at least 6 characters";
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Confirm Password Field
                buildLabel("Confirm Password"),
                TextFormField(
                  controller: _confirmPassController,
                  obscureText: _isConfirmObscure,
                  decoration: inputDecoration("Confirm password").copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(_isConfirmObscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => setState(() => _isConfirmObscure = !_isConfirmObscure),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Please confirm your password";
                    if (value != _passController.text) return "Passwords do not match"; // Match Logic
                    return null;
                  },
                ),

                SizedBox(height: 30),

                // Sign Up Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF673AB7),
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                  ),
                  onPressed: _validateAndSignUp,
                  child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text("Login", style: TextStyle(color: Color(0xFF673AB7), fontWeight: FontWeight.bold)),
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

  // UI Helpers
  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}