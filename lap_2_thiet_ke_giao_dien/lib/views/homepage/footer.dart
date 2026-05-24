import 'package:flutter/material.dart';

BottomNavigationBar buildHomePageFooter(){
  return BottomNavigationBar(
    backgroundColor: Colors.white,
    items: const[
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
      label: 'Home',
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.message),
      label: 'Message',
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.person),
      label: 'Profile',
      ),
    ],
  );
}