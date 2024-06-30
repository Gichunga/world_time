import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // @override
  // void initState() {
  //   super.initState();
  //
  //   print('choose location page initState function ran');
  //
  // }

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'gb.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'gr.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'eg.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'ke.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'us.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'sk.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'in.png'),
  ];


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
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  print(locations[index].location);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
