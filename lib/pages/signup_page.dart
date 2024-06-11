import 'package:rent_cars/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rent_cars/components/my_button.dart';
import 'package:rent_cars/components/my_textfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final FirebaseAuth auth2 = FirebaseAuth.instance;
    final DatabaseReference usersDatabaseRef =
      FirebaseDatabase.instance.ref().child("RegUsers");
  final userNamecon = TextEditingController();
  final userNIDAcon = TextEditingController();
  final userEmailcon = TextEditingController();
  final userPhonecon = TextEditingController();
  final passcon = TextEditingController();

  
    Future<void> signUpWithEmailPassword(String email, String password) async {
  try {
    UserCredential userCredential = await auth2.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // User signed up successfully
    User? user = userCredential.user;
  } catch (e) {
    print('Failed to sign up with email and password: $e');
  }


  
}



void addItemToDatabase(String phone,String Name,String Reg)async {
  await  usersDatabaseRef.child(Name)
                         .set({
                            "PhoneNumber": phone,
                           "NIDA": Reg,
                          
                          });
                  
          
                          

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
                // const SizedBox(
                //   height: 30,
                // ),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 43, 43),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.white70,
                    size: 140,
                  ),
                ),
                const Text(
                  "My Profile",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 43, 43),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myText: "enter full name",
                  obscu: false,
                  controller: userNamecon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter NIDA number",
                  obscu: false,
                  controller: userNIDAcon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter email address",
                  obscu: false,
                  controller: userEmailcon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter phone number",
                  obscu: true,
                  controller: userPhonecon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText:"enter password",
                  obscu: true,
                  controller: passcon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: "Sign Up",
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                     );
          
                   // signUpWithEmailPassword(userEmailcon.text, passcon.text);
                    //addItemToDatabase(userPhonecon.text,userNamecon.text,userNIDAcon.text);
               
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
