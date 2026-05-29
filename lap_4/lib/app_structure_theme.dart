import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(
    home: AppStructureTheme(),
    debugShowCheckedModeBanner: false,
  ));
}
class AppStructureTheme extends StatefulWidget{
  const AppStructureTheme({super.key});

  @override
  State<AppStructureTheme> createState() => _AppStructureThemeState();
}

class _AppStructureThemeState extends State<AppStructureTheme>{
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context){
    return Theme(data: _isDarkMode?
        ThemeData.dark(useMaterial3: true)
        :ThemeData.light(useMaterial3: true),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Exercise 4 – App Structure'),
            actions: [
              Row(
                children: [
                  const Text('Dark'),
                  Switch(value: _isDarkMode,
                      onChanged: (value){
                    setState(() {
                      _isDarkMode = value;
                    });
                      },
                  ),
                ],
              ),
            ],
          ),
          body: const Center(
            child: Text('This is a simple screen with theme toggle.', style: TextStyle(fontSize: 16),),
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Floating Action Button Tapped!')),
            );
          },
            child: const Icon(Icons.add),
          ),
        )
    );

  }

}
