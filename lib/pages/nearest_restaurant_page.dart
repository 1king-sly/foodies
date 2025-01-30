import 'package:flutter/material.dart';
import 'package:foodies/components/custom_app_bars.dart';

class NearestRestaurantPage extends StatefulWidget {
  const NearestRestaurantPage({super.key});

  @override
  State<NearestRestaurantPage> createState() => _NearestRestaurantPageState();
}

class _NearestRestaurantPageState extends State<NearestRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            const CustomAppBarTwo(
              text: 'Your Nearest Restaurants',
            ),
            const CustomAppBarThree(),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/vegan.webp'),
                          Text('name',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Text('12', style: TextStyle(color: Colors.green)),
                        ],
                      ),
                    );
                  })),
        ),
      ),
    );
  }
}
