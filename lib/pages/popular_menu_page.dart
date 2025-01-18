import 'package:flutter/material.dart';

class PopularMenuPage extends StatefulWidget {
  const PopularMenuPage({super.key});

  @override
  State<PopularMenuPage> createState() => _PopularMenuPageState();
}

class _PopularMenuPageState extends State<PopularMenuPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text("Popular Menus page"),
        )
      ],
    );
  }
}