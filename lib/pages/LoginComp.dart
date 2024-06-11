import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_cars/components/my_button.dart';
import 'package:rent_cars/components/my_textfield.dart';
import 'package:rent_cars/pages/company_page.dart';

class CompanyLogin extends StatelessWidget {
  CompanyLogin({super.key});
  final CompEmailcon = TextEditingController();
  final passcon = TextEditingController();
  final CompNamecon = TextEditingController();
  final CompRegcon = TextEditingController();
  final CompPhonecon = TextEditingController();

  void _showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('please fill the field'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

   void signInUser()async{

 await FirebaseAuth.instance.signInWithEmailAndPassword(
   email: CompEmailcon.text,
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
                  "Log In",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 43, 43),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myText: "enter company name",
                  obscu: false,
                  controller: CompNamecon,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  myText: "enter company email",
                  obscu: false,
                  controller: CompEmailcon,
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>CompanyHome(companyName: CompNamecon.text),
                    //   ),
                    // );

                    if (CompEmailcon.text != "" ||
                        passcon.text != "" ||
                        CompNamecon.text != "") {
                
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CompanyHome(companyName: CompNamecon.text),
                        ),
                      );
                    } else {
                      _showSnackbar(context);
                    }
                  },
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         'Are you Service Provider ?',
                //         style: TextStyle(),
                //       ),
                //       TextButton(
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => SignUpPage2(),
                //             ),
                //           );
                //         },
                //         child: Text(
                //           "Register Here",
                //           style: TextStyle(
                //             color: Colors.blue,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 18,
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
