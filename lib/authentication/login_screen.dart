import 'package:flutter/material.dart';
import 'package:rentomatic_app/authentication/singup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset("assets/image.jpg"),
              ),
              const SizedBox(height: 10),
              const Text(
                "Login as a Owner",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: emailtextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "E-Mail",
                  hintText: "E-Mail",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              TextField(
                controller: passwordtextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //todo
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                child: const Text(
                  "Don't have acccount  ? SingUp Here",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => SingUpScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
