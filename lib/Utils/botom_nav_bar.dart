import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  final selectedIndex;
  ValueChanged<int>? onClicked;

  BottomMenu({this.selectedIndex, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: "Category"),
        BottomNavigationBarItem(icon: Icon(Icons.storefront), label: "Product"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      currentIndex: selectedIndex,
      onTap: onClicked,
      selectedItemColor: Colors.red[800],
      unselectedItemColor: Colors.black38,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 14,
      unselectedFontSize: 12,
    );
  }
}
