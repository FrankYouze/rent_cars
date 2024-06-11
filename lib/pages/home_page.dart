import 'dart:convert';

import 'package:rent_cars/components/cust_car_tile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseReference companiesRef2 =
      FirebaseDatabase.instance.ref().child("RegCompaniesCars");
  Map<String, dynamic> registeredComp = {};
  Map<dynamic, dynamic> allCars = {};

  @override
  void initState() {
    super.initState();
    companiesRef2.onValue.listen((event) {
      setState(() {
        // print("hellw world");
        registeredComp = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
        print(registeredComp.keys);
        registeredComp.forEach((key, value) {
          // print("value ${value}");
          allCars = value;

          //print("reg keys "+key +"reg value" + value);
          // print("reg value "+value);
          // value.forEach((key,value){

          //  });
        });
      });
    });
    //print(registeredComp.length);
  }

  @override
  Widget build(BuildContext context) {
    //print(allCars);
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Rental App"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green[100],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: registeredComp.length,
                itemBuilder: (context, index) {
                  //print(registeredComp.length);
                  dynamic This = registeredComp.keys.elementAt(index);
                  print("id is " + This);
                  Map<dynamic, dynamic> hee = registeredComp[This];
                  // print("hee is "+ hee.keys.toString());
                  // allCars.keys.forEach(
                  //   (key) {
                  //     //print(allCars[key]);
                  //    // print(hee["companyName"]);
                  //   },
                  // );
                  //  print(allCars.keys.elementAt(index));
                  return CustCarTile(
                    imageUrl: hee['imageUrl'],
                    carModel: hee['carModel'],
                    description: hee['description'],
                    maxWeight: hee['maximumWeight'],
                    orderFunc: () async {
                      DatabaseReference ordersRef = FirebaseDatabase.instance
                          .ref()
                          .child("orderedCars")
                          .child(hee["companyName"]).child(This);
                      await ordersRef.set({
                        "carModel": hee['carModel'],
                        "imageUrl":hee['imageUrl']
                      
                      });
                    },
                    compName: hee["companyName"],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
