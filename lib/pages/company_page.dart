import 'package:firebase_database/firebase_database.dart';
import 'package:rent_cars/components/comp_car_tile.dart';
import 'package:rent_cars/pages/car_registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'car_status.dart';

class CompanyHome extends StatefulWidget {
  final String companyName;
  const CompanyHome({super.key, required this.companyName});

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  late String _companyName = "company";
  final DatabaseReference compOrdersRef =
      FirebaseDatabase.instance.ref().child("orderedCars");
  Map<String, dynamic> compOrderedCars = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.companyName != ""?
    _companyName = widget.companyName: _companyName = "not found";
    compOrdersRef.child(_companyName).onValue.listen((event) {
      setState(() {
        compOrderedCars = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
       // print("heee "+ compOrderedCars.keys.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(_companyName,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "REGISTERD",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900]),
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text("IN USE",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900]))),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text("ORDERS",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[900])))
                ],
              ),
            ),
            Expanded(
              child: Container(
                  color: Colors.green[50],
                  child: 
                  compOrderedCars.length != 0 ?
                  ListView.builder(
                      itemCount: compOrderedCars.length,
                      itemBuilder: (context, index) {
                        
                        dynamic CarId = compOrderedCars.keys.elementAt(index);
                           Map<dynamic, dynamic> carDetails =
                            compOrderedCars[CarId];
                          print(CarId);
                           return CarTile(
                            Tap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=> CarStatusPage(compName: _companyName,carId: CarId,)));
                            },
                            imageUrl: carDetails['imageUrl'] != null ? carDetails['imageUrl'] : " ",
                            carId: CarId,
                            carModel: carDetails['carModel']  != null ? carDetails['carModel'] : " ");
                      })
                      : Center(child: Text("No Registered Car Found"),)
                      ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CarRegPage()));
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
    );
  }
}
