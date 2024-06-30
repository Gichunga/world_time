import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setUpWorldTime() async {
    // create an instance of the worldTime class and assign properties
    WorldTime worldTimeInstance = WorldTime(
        location: 'Nairobi', flag: 'assets/kenya.png', url: 'Africa/Nairobi');
    // call the fetchTime method to assign the time property
    await worldTimeInstance.fetchTime();
    // update loading state with api time
    setState(() {
      time = worldTimeInstance.time;
    });

    // load home page and pass returned data
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTimeInstance.location,
      'time': worldTimeInstance.time,
      'flag': worldTimeInstance.flag,
    });
  }

  @override
  void initState() {
    super.initState();

    print('initState function ran');

    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(
          time,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
