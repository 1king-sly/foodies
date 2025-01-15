import 'package:flutter/material.dart';
import 'package:foodies/components/nearest_restaurants.dart';
import 'package:foodies/components/popular_menu.dart';
import 'package:foodies/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar

              Container(
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/pattern2.jpg'),
                    fit: BoxFit.cover,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.grey.shade100,
                      // Colors.white,
                      Colors.white,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 233,
                                height: 82,
                                child: Text(
                                  "Find Your Favorite Food",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 31),
                                  maxLines: 3,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 15.0, // soften the shadow
                                      spreadRadius: 5.0, //extend the shadow
                                      offset: const Offset(
                                        5.0, // Move to right 5  horizontally
                                        5.0, // Move to bottom 5 Vertically
                                      ),
                                    )
                                  ],
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.notifications,
                                      color: primaryColor),
                                  onPressed: () {},
                                ),
                              ),
                            ]),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "What do you want to order?",
                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(100, 218, 98, 23),
                                    fontSize: 12,
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(20, 249, 169, 77),
                                  prefixIcon: const Icon(Icons.search,
                                      color: Color(0xFFDA6317)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(20, 249, 169, 77),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.filter_list,
                                  color: Color(0xFFDA6317),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),

              // Promotion Banner
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
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
              ),
              const SizedBox(height: 20),

              // Nearest Restaurant Section
              NearestRestaurants(
                children: [
                  _buildRestaurantCard("Vegan Resto", "12 Mins"),
                  _buildRestaurantCard("Healthy Food", "8 Mins"),
                  _buildRestaurantCard("Vegan Resto", "12 Mins"),
                  _buildRestaurantCard("Healthy Food", "8 Mins"),
                ],
              ),

              const SizedBox(height: 10),

              PopularMenu(children: [
                _buildMenuCard("Green Noodle", "\$15"),
                _buildMenuCard("Fried Chicken", "\$12"),
                _buildMenuCard("Green Noodle", "\$15"),
                _buildMenuCard("Fried Chicken", "\$12"),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.white,
        elevation: 1,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.home_outlined,
                  color:
                      currentIndex == 0 ? primaryColor : Colors.grey.shade400,
                  size: 25,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.person,
                  color:
                      currentIndex == 1 ? primaryColor : Colors.grey.shade400,
                  size: 25,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icon(Icons.shopping_cart,
                    color:
                        currentIndex == 3 ? primaryColor : Colors.grey.shade400,
                    size: 25),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 4;
                  });
                },
                icon: Icon(
                  Icons.notifications,
                  color:
                      currentIndex == 4 ? primaryColor : Colors.grey.shade400,
                  size: 25,
                ),
              ),
            ]),
      ),
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
