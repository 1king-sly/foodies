import 'package:flutter/material.dart';
import 'package:foodies/components/custom_app_bars.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class PopularMenuPage extends StatefulWidget {
  const PopularMenuPage({super.key});

  @override
  State<PopularMenuPage> createState() => _PopularMenuPageState();
}

class _PopularMenuPageState extends State<PopularMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            const CustomAppBarTwo(
              text: 'The Popular Menus',
            ),
            const CustomAppBarThree(),
          ];
        },
        body: LazyLoadScrollView(
          onEndOfPage: () {},
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: 323,
                    height: 100,
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
                  const SizedBox(height: 10),
              itemCount: 10,
            ),
          ),
        ),
      ),
    );
  }
}
