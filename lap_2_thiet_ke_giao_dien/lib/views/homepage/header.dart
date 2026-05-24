import 'package:flutter/material.dart';

AppBar buildHomePageHeader(){
  return AppBar(
    title: const Text("HomePage"),
    backgroundColor: Colors.lightBlue,
    leading: IconButton(onPressed: (){},
      icon: const Icon(Icons.menu),
    ),
    actions: [
      IconButton(onPressed: (){},
          icon: const Icon(Icons.search),
      ),
      IconButton(onPressed: (){},
          icon: const Icon(Icons.settings),
      ),
    ],
  );
}