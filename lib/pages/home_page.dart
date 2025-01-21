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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            const CustomAppBarOne(),
            const CustomAppBarTwo(),
            const CustomAppBarThree(),
          ];
        },
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: screens[currentScreenIndex]),
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

class CustomAppBarOne extends StatelessWidget {
  const CustomAppBarOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 30,
      leading: Container(
        // alignment: const Alignment(0, 0),
        width: 45,
        height: 45,
        decoration: const BoxDecoration(
          color: Color.fromARGB(17, 218, 98, 23),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.arrow_left_sharp,
              color: Color(0xFFDA6317),
              size: 30,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications, color: primaryColor),
              onPressed: () {},
            ),
          ),
        ),
      ],
      elevation: 0.0,
      backgroundColor: Colors.white,
      pinned: true,
      bottom: PreferredSize(
        // Add this code
        preferredSize: const Size.fromHeight(-8), // Add this code
        child: Container(), // Add this code
      ),
    );
  }
}

class CustomAppBarTwo extends StatelessWidget {
  const CustomAppBarTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(),
      title: Container(),
      backgroundColor: Colors.white,
      expandedHeight: 70,
      floating: false,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/pattern2.webp'),
                    fit: BoxFit.cover),
                color: Colors.white,
              ),
              child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SizedBox(
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
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}

class CustomAppBarThree extends StatelessWidget {
  const CustomAppBarThree({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(),
      elevation: 10,
      bottom: const PreferredSize(
        // Add this code
        preferredSize: Size.fromHeight(-20), // Add this code
        child: Text(''), // Add this code
      ),
      backgroundColor: Colors.white,
      pinned: true,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: FlexibleSpaceBar(
          background: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
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
                          fillColor: const Color.fromARGB(20, 249, 169, 77),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
