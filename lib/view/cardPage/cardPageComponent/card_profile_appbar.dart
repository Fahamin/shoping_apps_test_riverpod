import 'package:flutter/material.dart';

class CardProfileAppBar extends StatelessWidget {
  final Widget title;

  CardProfileAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu),
      ),
      title: title,
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.search),
      ),
    );
  }
}
