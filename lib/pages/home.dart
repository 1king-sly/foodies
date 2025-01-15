import 'package:flutter/material.dart';
import 'package:foodies/components/nearest_restaurants.dart';
import 'package:foodies/components/popular_menu.dart';
import 'package:foodies/components/popular_restaurants.dart';
import 'package:foodies/constants/constants.dart';

class Home extends StatefulWidget {
    final Function(int) setCurrentScreenIndex;

  const Home({super.key, required this.setCurrentScreenIndex});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pattern2.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              )),
          foregroundDecoration: const BoxDecoration(
              color: Color.fromARGB(100, 21, 190, 120),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              )),
          child: Stack(
            children: [
              Positioned(
                top: 30,
                right: 5,
                child: Column(
                  children: [
                    const Text(
                      "Special Deal For October",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 10,
                top: 30,
                child: Image.asset(
                  'assets/images/ice_cream.png', // Replace with your image path
                  height: 100,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Nearest Restaurant Section
        NearestRestaurants(
          setCurrentScreenIndex:widget.setCurrentScreenIndex,
          children: [
            _buildRestaurantCard("Vegan Resto", "12 Mins"),
            _buildRestaurantCard("Healthy Food", "8 Mins"),
            _buildRestaurantCard("Vegan Resto", "12 Mins"),
            _buildRestaurantCard("Healthy Food", "8 Mins"),
          ],
        ),

        const SizedBox(height: 10),

        PopularMenu(
                    setCurrentScreenIndex:widget.setCurrentScreenIndex,

          children: [
          _buildMenuCard("Green Noodle", "\$15"),
          _buildMenuCard("Fried Chicken", "\$12"),
          _buildMenuCard("Green Noodle", "\$15"),
          _buildMenuCard("Fried Chicken", "\$12"),
        ]),
        const SizedBox(height: 10),

        PopularRestaurants(
                    setCurrentScreenIndex:widget.setCurrentScreenIndex,

          children: [
          _buildRestaurantCard("Vegan Resto", "12 Mins"),
          _buildRestaurantCard("Healthy Food", "8 Mins"),
          _buildRestaurantCard("Vegan Resto", "12 Mins"),
          _buildRestaurantCard("Healthy Food", "8 Mins"),
        ]),
      ],
    );
  }

  Widget _buildRestaurantCard(String name, String time) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(time, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(String name, String price) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(price, style: const TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
