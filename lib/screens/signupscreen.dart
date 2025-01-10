import 'package:bcs/controllers/signup_controllers.dart';

import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var userform = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Form(
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
                  SizedBox(
                    height: 25,
                  ),
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
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ("Name is required");
                      }
                      return null;
                    },
                    decoration: InputDecoration(label: Text("Name")),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: country,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ("Required field");
                      }
                      return null;
                    },
                    decoration: InputDecoration(label: Text("Country")),
                  ),SizedBox(
                    height: 25,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(0, 50),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 87, 169, 197),
                          ),
                          onPressed: () {
                            if (userform.currentState!.validate()) {
                              SignupControllers.createAccount(
                                context: context,
                                email: email.text,
                                password: password.text,
                                name:name.text,
                                Country: country.text
                                

                              
                              );
                            }
                          },
                          child: Text("Sign up"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
