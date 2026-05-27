import 'package:flutter/material.dart';
import 'views/homepage/body.dart';
import 'views/homepage/footer.dart';
import 'views/homepage/header.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: buildHomePageHeader(),
        body: HomePageBody(),
        bottomNavigationBar: buildHomePageFooter(),

      ),
    );
  }
}