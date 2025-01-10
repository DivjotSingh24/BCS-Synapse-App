import 'package:bcs/screens/signupscreen.dart';
import 'package:bcs/controllers/login_controllers.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userform = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  void loginUser() async {
    if (userform.currentState!.validate()) {
      setState(() {
        isLoading = true; // Show loading indicator
      });

      await LoginControllers.login(
        context: context,
        email: email.text,
        password: password.text,
      );

      setState(() {
        isLoading = false; // Hide loading indicator after login
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: userform,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 200,
                child: Image.asset('assets/images/logo.png'),
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ("Email is required");
                  }
                  return null;
                },
                decoration: InputDecoration(label: Text("Email Id")),
              ),
              SizedBox(height: 25),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ("Password is required");
                  } else if (value.length < 8) {
                    return ("Password must be at least 8 characters");
                  }
                  return null;
                },
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(label: const Text("Password")),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: isLoading
                        ? Center(
                            child:
                                CircularProgressIndicator()) // Show loading indicator
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 50),
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 87, 169, 197),
                            ),
                            onPressed: loginUser,
                            child: Text("Login"),
                          ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Center(child: Text("Don't have an account? ")),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignupScreen();
                      }));
                    },
                    child: Text("Click to sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[400],
                          decoration: TextDecoration.underline,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
