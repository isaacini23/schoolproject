import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'signup_screen.dart';
import 'forgot_password_screen.dart';

import 'package:schoolproject/screen/main_screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Login"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.h),
              Text(
                "Fluttef",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              SizedBox(height: 30.h),
              Text("Log-in", style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 20.h),
              TextField(
                decoration: InputDecoration(labelText: "Email"),
              ),
              SizedBox(height: 15.h),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPasswordScreen()));
                  },
                  child: Text("Forgot Password?"),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));},
                  child: Text("Log-in"),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
                  },
                  child: Text("Don't have an account? Sign up", style: TextStyle(color: Color.fromARGB(255, 148, 41, 33))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
