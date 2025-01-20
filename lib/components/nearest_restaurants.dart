import 'package:flutter/material.dart';

class NearestRestaurants extends StatefulWidget {
      final Function(int) setCurrentScreenIndex;

  const NearestRestaurants({super.key,  required this.setCurrentScreenIndex});

  @override
  State<NearestRestaurants> createState() => _NearestRestaurantsState();
}

class _NearestRestaurantsState extends State<NearestRestaurants> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Nearest Restaurant",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                                      widget.setCurrentScreenIndex(1);

                },
                child: const Text("View More"),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        width: 200,
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
            Text("name", style:  TextStyle(fontWeight: FontWeight.bold)),
             SizedBox(height: 5),
            Text("10", style:  TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 10),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
