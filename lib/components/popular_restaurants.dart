import 'package:flutter/material.dart';

class PopularRestaurants extends StatefulWidget {
      final Function(int) setCurrentScreenIndex;

  final List<Widget> children;
  const PopularRestaurants({super.key, required this.children, required this.setCurrentScreenIndex});

  @override
  State<PopularRestaurants> createState() => _PopularRestaurantsState();
}

class _PopularRestaurantsState extends State<PopularRestaurants> {
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
                  "Popular Menu",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.setCurrentScreenIndex(3);
                  },
                  child: const Text("View More"),
                ),
              ],
            ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Row(children: widget.children);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 10),
              itemCount: widget.children.length,
            ),
          ),
        ],
      ),
    );
  }
}
