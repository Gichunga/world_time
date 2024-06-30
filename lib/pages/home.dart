import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    // set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    // set scaffold background color according to time of the day
    Color bgColor = data['isDaytime'] ? Colors.blueGrey : Colors.black45;

    return Scaffold(
      backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover,
                ),
              ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: const Icon(Icons.edit_location_alt,),
                    label: const Text(
                      'edit location',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/${data["flag"]}',
                        width: 60.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        data['location'],
                        style: const TextStyle(fontSize: 28.0, letterSpacing: 2.0, color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: const TextStyle(
                      fontSize: 64.0,
                      color: Colors.white70
                    ),
                  ),
                ],
              ),
            ),
    )));
  }
}
