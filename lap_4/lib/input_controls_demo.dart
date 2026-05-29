import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: InputControlsDemo(),
    debugShowCheckedModeBanner: false,
  ));
}
class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}
class _InputControlsDemoState extends State<InputControlsDemo> {
  double _sliderValue = 50.0;
  bool _isMovieActive = false;
  String _selectedGenre = 'None';
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 – Input Controls'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rating (Slider)',
            style: TextStyle(fontSize: 18
            ,fontWeight: FontWeight.bold),),
            Slider(value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: _sliderValue.round().toString(),
              onChanged: (double value){
                setState(() {
                  _sliderValue = value;
                });
              },
            ),

            Text('Current value: ${_sliderValue.round()}'),
            const SizedBox(height: 20,),
            const Text('Active (Switch)',
            style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold),),
            SwitchListTile(
                title: const Text('Is movie active?'),
                value: _isMovieActive,
                onChanged: (bool value){
                  setState(() {
                    _isMovieActive = value;
                  });
                },
                ),

            const SizedBox(height: 20,),

            const Text('Genre (RadioListTile)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              title: const Text('Action'),
              value: 'Action',
              groupValue: _selectedGenre,
              onChanged: (String? value) {
                setState(() {
                  _selectedGenre = value ?? 'None';
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: _selectedGenre,
              onChanged: (String? value){
                setState(() {
                  _selectedGenre = value ?? 'None';
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Horror'),
              value: 'Horror',
              groupValue: _selectedGenre,
              onChanged: (String? value){
                setState(() {
                  _selectedGenre = value ?? 'None';
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Isekai'),
              value: 'Isekai',
              groupValue: _selectedGenre,
              onChanged: (String? value){
                setState(() {
                  _selectedGenre = value ?? 'None';
                });
              },
            ),

            Text('Selected genre: $_selectedGenre'),
            const SizedBox(height: 25,),
            Center(
              child: Column(
                children: [
                  ElevatedButton(onPressed: ()=> _selectDate(context),
                      child: const Text('Open Date Picker'),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    _selectedDate == null? 'No date selected'
                        : 'Selected Date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}