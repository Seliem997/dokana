import 'package:dokana/screens/cart.dart';
import 'package:dokana/screens/categories.dart';
import 'package:dokana/screens/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'home_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {

  int _selectedIndex =0;

  final List _pages=[
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const UserScreen(),
  ];
  // final List<String> _titles=[
  //   'HomeScreen',
  //   'CategoriesScreen',
  //   'CartScreen',
  //   'UserScreen',
  // ];
  //
  // final List<Map<String, dynamic>> _screens=[
  //   {'page' : const HomeScreen(), 'title' : 'Home Screen' },
  //   {'page' : const CategoriesScreen(), 'title' : 'Categories Screen' },
  //   {'page' : const CartScreen(), 'title' : 'Cart Screen' },
  //   {'page' : const UserScreen(), 'title' : 'User Screen' },
  // ];

  void _selectPage(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //       // _titles[_selectedIndex]
      //     _screens[_selectedIndex]['title']
      //   ),
      // ),
      body: _pages[_selectedIndex],
      // body: _screens[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1 ? IconlyBold.category :IconlyLight.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2 ? IconlyBold.buy :IconlyLight.buy),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3 ? IconlyBold.user2 :IconlyLight.user2),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
