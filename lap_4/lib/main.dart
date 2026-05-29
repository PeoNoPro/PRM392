import 'package:flutter/material.dart';
import 'core_widgets_demo.dart';
import 'input_controls_demo.dart';
import 'layout_demo.dart';
import 'app_structure_theme.dart';
import 'common_ui_fixes.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Lab 4 - Flutter UI', debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      home: const MainMenuScreen(),
    );
  }
}

class MainMenuScreen extends StatelessWidget{
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context){
    final List<Map<String,dynamic>> exercises = [
      {
        'title' : 'Exercise 1 - Core Widgets Demo', 'screen' : const CoreWidgetsDemo()
      },
      {
        'title' : 'Exercise 2 - Input Controls Demo', 'screen' : const InputControlsDemo()
      },
      {
        'title' : 'Exercise 3 - Layout Demo', 'screen' : const LayoutDemo()
      },
      {
        'title' : 'Exercise 4 - App Structure & Theme', 'screen' : const AppStructureTheme()
      },
      {
        'title' : 'Exercise 5 - Common UI Fixes', 'screen' : const CommonUiFixes()
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4_Flutter UI Fundamentals'),
        elevation: 2,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        itemBuilder: (context, index){
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                exercises[index]['title'],
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => exercises[index]['screen']),
                );
              },
            ),
          );
        },
      ),
    );
  }
}