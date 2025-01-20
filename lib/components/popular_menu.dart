import 'package:flutter/material.dart';

class PopularMenu extends StatefulWidget {
      final Function(int) setCurrentScreenIndex;
  const PopularMenu({super.key, required this.setCurrentScreenIndex});

  @override
  State<PopularMenu> createState() => _PopularMenuState();
}

class _PopularMenuState extends State<PopularMenu> {
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
                                        widget.setCurrentScreenIndex(2);

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
        child:const  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('name', style:  TextStyle(fontWeight: FontWeight.bold)),
             SizedBox(height: 5),
            Text('12', style:  TextStyle(color: Colors.green)),
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
