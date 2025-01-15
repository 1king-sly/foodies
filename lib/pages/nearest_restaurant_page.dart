import 'package:flutter/material.dart';

class NearestRestaurantPage extends StatefulWidget {
  const NearestRestaurantPage({super.key});

  @override
  State<NearestRestaurantPage> createState() => _NearestRestaurantPageState();
}

class _NearestRestaurantPageState extends State<NearestRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child:Text("Neared Restaurants"),
      )
    );
  }
}