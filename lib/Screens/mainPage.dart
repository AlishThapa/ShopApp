import 'package:daraz_pro_max/Screens/ProductOverview/ProductOverview.dart';
import 'package:flutter/material.dart';

import 'MyAccount.dart';
import 'ProductDetail/ProductDetail.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    ProductOverview(),
    Profile(),
  ];

  int CurrentIndex = 0;

  void onTap(int index) {
    setState(() {
      CurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[CurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        unselectedFontSize: 0,
        currentIndex: CurrentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
