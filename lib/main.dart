import 'package:flutter/material.dart';
import 'package:rent_cars/firebase_options.dart';

import 'package:rent_cars/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rent_cars/pages/signup_page.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

//     WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
//  FirebaseAppCheck firebaseAppCheck = FirebaseAppCheck.instance;
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
   
      home:SignUpPage(),
    );
  }
}
