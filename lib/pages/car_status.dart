import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CarStatusPage extends StatefulWidget {
  final String carId;
  final String compName;
  const CarStatusPage({super.key, required this.carId, required this.compName});

  @override
  State<CarStatusPage> createState() => _CarStatusPageState();
}

class _CarStatusPageState extends State<CarStatusPage> {
   final DatabaseReference regCarsRef =
      FirebaseDatabase.instance.ref().child("RegCompaniesCars");
      Map<dynamic,dynamic> allCars = {};
      Map<dynamic,dynamic>carDetails = {};
      Map<dynamic,dynamic> companyCars = {};
  late String _carId;
  late String _compName;
  Map<dynamic,dynamic> locationDetails = {};
 @override
  void initState() {
    // TODO: implement initState
    _carId = widget.carId;
    _compName = widget.compName;
    super.initState();

regCarsRef.onValue.listen((event) {
      setState(() {
        allCars = Map<String, dynamic>.from(
            event.snapshot.value as Map<dynamic, dynamic>);
   carDetails = allCars[_carId];
   locationDetails = carDetails['location'];
   print(carDetails);
    //carDetails.containsValue(_compName);
      
      });
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.green[100],
      body:SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Image(
                height: 350,
                width: double.infinity,
                image: NetworkImage(carDetails['imageUrl'] != null? carDetails['imageUrl'] : "" )),
                SizedBox(height: 10,),
              Column(children: [  Text(carDetails['carModel'] != null? carDetails['carModel'] : ""),
                 SizedBox(height: 10,),
                Text(carDetails['maximumWeight'] != null? carDetails['maximumWeight']  + "    current weight" : "" ),
                 SizedBox(height: 10,),
                 Text(carDetails['description'] != null? carDetails['description'] : ""),
                 SizedBox(height: 10,),
                 ElevatedButton(onPressed: () async{
                  print(carDetails['location']['latitude']);
  Uri googleMapsUrl = await Uri.parse('https://www.google.com/maps/search/?api=1&query=${carDetails['location']['latitude']},${carDetails['location']['longitude']}');
    await launchUrl(googleMapsUrl);


                 }, child: Text("location")),],),
                 SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(_compName),
                  ElevatedButton(
                  
                    onPressed: (){}, child: Text("Rent out",style: TextStyle(color: Colors.green),))
                ],)
                
              ],
            ),
          ),
        )
           ,
      )
    );
  }
}