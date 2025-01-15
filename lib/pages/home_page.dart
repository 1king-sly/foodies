import 'package:flutter/material.dart';
import 'package:foodies/constants/constants.dart';
import 'package:foodies/pages/home.dart';
import 'package:foodies/pages/nearest_restaurant_page.dart';
import 'package:foodies/pages/popular_menu_page.dart';
import 'package:foodies/pages/popular_restaurants_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int currentScreenIndex = 0;
  List<Widget> screens = [];

  void setCurrentScreenIndex(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    screens = [
      Home(setCurrentScreenIndex: setCurrentScreenIndex),
      const NearestRestaurantPage(),
      const PopularMenuPage(),
      const PopularRestaurantsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
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
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 2),
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
                  ),
            
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: screens[currentScreenIndex]),
                ],
              ),
            ),
          ],
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
                    currentScreenIndex = 0;
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
                  Icons.chat_outlined,
                  color:
                      currentIndex == 4 ? primaryColor : Colors.grey.shade400,
                  size: 25,
                ),
              ),
            ]),
      ),
    );
  }

 
}
