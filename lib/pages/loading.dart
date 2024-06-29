import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    print('initState function ran');
  }

  void fetchTime() async {
    final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Nairobi'));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      print(data);

      // get properties from data
      String datetime = data['datetime'];
      // the substring of offset from start- inclusive to end- exclusive
      String offset = data['utc_offset'].substring(1,3);
      // print(offset);

      // create datetime object
      DateTime now = DateTime.parse(datetime);
      // print(now);
      // parse offset to integer and it today's date
      now = now.add(Duration(hours: int.parse(offset)));
      print(now);
    } else {
      print('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchTime();
    return const Scaffold(
      body: Text('loading'),
    );
  }
}
