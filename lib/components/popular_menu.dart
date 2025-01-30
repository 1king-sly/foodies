import 'package:flutter/material.dart';
import 'package:foodies/pages/popular_menu_page.dart';

class PopularMenu extends StatefulWidget {
  const PopularMenu({super.key});

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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PopularMenuPage()));
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
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: 323,
                    height: 87,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 87,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/vegan.webp',
                                        ),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'This is a long name that may overflow',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                            color: Colors.grey.shade400),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(height: 5),
                        Text('12',
                            style:
                                TextStyle(color: Colors.green, fontSize: 22)),
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
