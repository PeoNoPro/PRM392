import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LayoutDemo(),
    debugShowCheckedModeBanner: false,
  ));
}
class LayoutDemo extends StatelessWidget{
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context){
    final List<String> movies = ['Avatar','Inception','Doraemon','Shin','Joker','Conan',];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 – Layout Demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Now playing',
              style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8,),

         Expanded(
           child: ListView.builder(
           padding: const EdgeInsets.symmetric(horizontal: 16),
             itemCount: movies.length,
             itemBuilder: (context, index){
             final movieName = movies[index];
             return Card(
               margin: const EdgeInsets.symmetric(vertical: 8),
               child: ListTile(
                 leading: CircleAvatar(
                   backgroundColor: Colors.blue.shade100,
                   child: Text(movieName[0],style: const TextStyle(color: Colors.blue),),
                 ),
                 title: Text(movieName),
                 subtitle: const Text('Sample description'),
               ),
             );
             },
           ),
         ),
        ],
      ),
    );
  }
}