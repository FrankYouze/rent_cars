import 'package:flutter/material.dart';
import 'package:rent_cars/components/my_button.dart';

class CustCarTile extends StatelessWidget {
  final String imageUrl;
  final String carModel;
  final String maxWeight;
  final String description;
  final String compName;
  final Function()? orderFunc;
  const CustCarTile({super.key, required this.imageUrl, required this.carModel, required this.maxWeight, required this.description, this.orderFunc, required this.compName});

  @override
  Widget build(BuildContext context) {
    return Card(


      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Image(
              height: 200,
              width: double.infinity,
              image: NetworkImage(imageUrl)),
              SizedBox(height: 10,),
              Text("Car Model "+carModel),
               SizedBox(height: 10,),
              Text("maximum Weight "+maxWeight),
               SizedBox(height: 10,),
               Text(description),
               SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(compName),
                ElevatedButton(
                
                  onPressed: orderFunc, child: Text("Place Order",style: TextStyle(color: Colors.green),))
              ],)
              
            ],
          ),
        ),
      )
    );
  }
}