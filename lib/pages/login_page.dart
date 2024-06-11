import 'package:firebase_auth/firebase_auth.dart';
import 'package:rent_cars/components/my_button.dart';
import 'package:rent_cars/components/my_textfield.dart';
import 'package:rent_cars/pages/home_page.dart';
import 'package:rent_cars/pages/signup_page.dart';
import 'package:rent_cars/pages/signup_page2.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userEmailcon = TextEditingController();
  final passcon = TextEditingController();

 void signInUser()async{

 await FirebaseAuth.instance.signInWithEmailAndPassword(
   email: userEmailcon.text,
    password: passcon.text);

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                const Text(
                  "Sign In",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 43, 43),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myText: "enter user name",
                  obscu: false,
                  controller: userEmailcon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter password",
                  obscu: true,
                  controller: passcon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: "Login",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Are you Service Provider ?',
                        style: TextStyle(),
                      ),
                      TextButton(
                        onPressed: () {
                         // signInUser();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage2(),
                            ),
                          );
                        },
                        child: Text(
                          "Register Here",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
