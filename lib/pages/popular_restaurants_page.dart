import 'package:flutter/material.dart';

class PopularRestaurantsPage extends StatefulWidget {
  const PopularRestaurantsPage({super.key});

  @override
  State<PopularRestaurantsPage> createState() => _PopularRestaurantsPageState();
}

class _PopularRestaurantsPageState extends State<PopularRestaurantsPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text("Popular Restaurants"),
        )
      ],
    );
  }
}