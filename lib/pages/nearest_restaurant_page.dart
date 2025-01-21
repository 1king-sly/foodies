import 'package:flutter/material.dart';
import 'package:foodies/pages/home_page.dart';

class NearestRestaurantPage extends StatefulWidget {
  const NearestRestaurantPage({super.key});

  @override
  State<NearestRestaurantPage> createState() => _NearestRestaurantPageState();
}

class _NearestRestaurantPageState extends State<NearestRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    var children = [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
      // const SizedBox(height: 10),
      GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.78,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('name', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('12', style: TextStyle(color: Colors.green)),
                ],
              ),
            );
          })
    ];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            const CustomAppBarOne(),
            const CustomAppBarTwo(),
            const CustomAppBarThree(),
          ];
        },
        body: const Center(
          child: Text("Hello Sliver AppBar"),
        ),
      ),
    );
  }
}
