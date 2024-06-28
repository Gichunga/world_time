import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        centerTitle: true,
        title: const Text('Choose a Location'),
      ),
      body: TextButton(
        onPressed: () {
          setState(() { // trigger the build function
            counter += 1;
          });
        },
        child: Text('Counter is: $counter'),
      ),
    );
  }
}
