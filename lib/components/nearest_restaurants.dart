import 'package:flutter/material.dart';

class NearestRestaurants extends StatefulWidget {
  final List<Widget> children;
  const NearestRestaurants({super.key, required this.children});

  @override
  State<NearestRestaurants> createState() => _NearestRestaurantsState();
}

class _NearestRestaurantsState extends State<NearestRestaurants> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
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
                  onPressed: () {},
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
      ),
    );
  }
}
