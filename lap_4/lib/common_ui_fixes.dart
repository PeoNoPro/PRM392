import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(
    home: CommonUiFixes(),
    debugShowCheckedModeBanner: false,
  ));
}
class CommonUiFixes extends StatefulWidget {
  const CommonUiFixes({super.key});

  @override
  State<CommonUiFixes> createState() => _CommonUiFixesState();
}

class _AppUiFixesState extends State<CommonUiFixes> {
  int _counter = 0;
  DateTime? _fixedDate;

  void _showFixedDatePicker(BuildContext context) async{
    final DateTime? picked  = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
    );
    if (picked!= null) {
      setState(() {
        _fixedDate = picked;
      });
      
    }  
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 – UI Fixes'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Correct ListView inside Column using Expanded',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              SizedBox(
                height: 200,
                child: ListView(
                  children: const [
                    ListTile(leading: Icon(Icons.movie),title: Text('Movie Conan'),),
                    ListTile(leading: Icon(Icons.movie),title: Text('Movie Shin'),),
                    ListTile(leading: Icon(Icons.movie),title: Text('Movie Doraemon'),),
                    ListTile(leading: Icon(Icons.movie),title: Text('Movie Tom & Jerry'),),

                  ],
                ),
              ),
              const Divider(height: 40,),
              Text('Counter Value: $_counter', style: const TextStyle(fontSize: 16),),
              ElevatedButton(onPressed: (){
                setState(() {
                  _counter++;
                });
              }, child: const Text('Increment Counter (setState Fix)'),),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: ()=> _showFixedDatePicker(context),
                  child: const Text('Pick Date (Valid Context Fix)'),),
              if (_fixedDate != null) Text('Picked: ${_fixedDate!.day}/${_fixedDate!.month}/${_fixedDate!.year}',),
              const SizedBox(height: 300,),
              const Text('Bottom content - No Overflow thanks to SingleChildScrollView!',),

            ],
          ),
        ),
      ),
    );


  }
}
class _CommonUiFixesState extends State<CommonUiFixes>{
  int _counter  = 0;
  DateTime? _fixedDate;

  void _showFixedDatePicker(BuildContext context) async{
    final DateTime? picked = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),);
    if (picked!= null) {
      setState(() {
        _fixedDate = picked;
      });

    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 5 – UI Fixes'),),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Correct ListView inside Column using Expanded',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            SizedBox(
              height: 200,
              child: ListView(
                children: const[
                  ListTile(leading: Icon(Icons.movie),title: Text('Movie Conan'),),
                  ListTile(leading: Icon(Icons.movie),title: Text('Movie Shin'),),
                  ListTile(leading: Icon(Icons.movie),title: Text('Movie Doraemon'),),
                  ListTile(leading: Icon(Icons.movie),title: Text('Movie Tom & Jerry'),),
                ],
              ),
            ),
            const Divider(height: 40,),
            Text('Counter Value: $_counter', style: const TextStyle(fontSize: 16),),
            ElevatedButton(onPressed: (){
              setState(() {
                _counter++;
              });
            }, child: const Text('Increment Counter (setState Fix)'),),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: ()=> _showFixedDatePicker(context),
                child: const Text('Pick Date (Valid Context Fix)'),),
            if(_fixedDate != null) Text('Picked: ${_fixedDate!.day}/${_fixedDate!.month}/${_fixedDate!.year}'),
            const SizedBox(height: 300,),
            const Text('Bottom content - No Overflow thanks to SingleChildScrollView!'),
          ],
        ),
        ),

      ),
    );
  }


}
