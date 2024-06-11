import 'dart:io';

import 'package:rent_cars/components/my_button.dart';
import 'package:rent_cars/components/my_textfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class CarRegPage extends StatelessWidget {
  CarRegPage({super.key});
  final Reference CarImagesData =
      FirebaseStorage.instance.ref().child("RegisteredCarsImages");
final DatabaseReference companiesRef =
      FirebaseDatabase.instance.ref().child("RegCompaniesCars");

  final compNameCon = TextEditingController();
  final carIdCon = TextEditingController();
  final carModelCon = TextEditingController();
  final maxWeightCon = TextEditingController();
  final desCon = TextEditingController();
  String ImageUrl = "";

  void registerCarToComp(String companyName,String carId,String carModel,String maxWeight,String description,String carImage)async {
  await  companiesRef.child(carId)
                         .set({
                            "carModel": carModel,
                           "maximumWeight": maxWeight,
                           "description": description,
                           "imageUrl": carImage,
                            "companyName": companyName,
                            "location": []
                            
                          });
                  
          
                          

}
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                // const SizedBox(
                //   height: 30,
                // ),
                const Text(
                  "Car registration",
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 43, 43),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    ImagePicker picker = ImagePicker();
                    XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
                    print('${imageFile?.path}');
                    if (imageFile == null) return;

                    String uniqueName =
                        DateTime.now().microsecondsSinceEpoch.toString();
                    Reference newImage = CarImagesData.child(uniqueName);
                    try {
                      await newImage.putFile(File(imageFile.path));
                      ImageUrl = await newImage.getDownloadURL();
                    } catch (error) {
                      print(error);
                    }
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Icon(
                      Icons.camera,
                      color: Colors.white70,
                      size: 130,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                 MyTextField(
                  myText: "enter company name",
                  obscu: false,
                  controller: compNameCon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter car id",
                  obscu: false,
                  controller: carIdCon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter car model",
                  obscu: false,
                  controller: carModelCon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter maximum weight",
                  obscu: false,
                  controller: maxWeightCon,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  myText: "enter description",
                  obscu: false,
                  controller: desCon,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: "Register",
                  onTap: () {
                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => HomePage()),
                    //   );
                    print(ImageUrl);
                    registerCarToComp(compNameCon.text, carIdCon.text, carModelCon.text, maxWeightCon.text, desCon.text, ImageUrl);
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
