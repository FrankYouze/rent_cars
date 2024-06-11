import 'package:rent_cars/pages/car_status.dart';
import 'package:flutter/material.dart';

class CarTile extends StatelessWidget {
  final String imageUrl;
  final String carId;
  final String carModel;
  final Function()? Tap;
  const CarTile({super.key, required this.imageUrl, required this.carId, required this.carModel,required this.Tap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
     
        title: Text(carModel),
        subtitle:Text(carId),
        leading: Image(
            height: 100,
            width: 100,
            image:NetworkImage(imageUrl)),
            onTap: Tap,
            
      ),
    );
  }
}