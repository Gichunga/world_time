import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class WorldTime {
  // declare world time class properties
  String location; // the location we are finding time for
  late String time; // the time in that location
  String url; // location url for the api endpoint
  String flag; // url to an asset flag url
  bool isDaytime = false;

  // constructor
  WorldTime({required this.location, required this.flag, required this.url});

  // define an async function to wait assignment to the time property
  Future<void> fetchTime() async {
    try {
      final response = await http
          .get(
          Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Nairobi'));

      // if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      // the substring of offset from start- inclusive to end- exclusive
      String offset = data['utc_offset'].substring(1, 3);
      // create datetime object
      DateTime now = DateTime.parse(datetime);
      // parse offset to integer and it today's date
      now = now.add(Duration(hours: int.parse(offset)));
      // initialize isDatetime variable based on the time of the day
      isDaytime = now.hour > 6 && now.hour < 20;
      // initialize the time property and return it
      time = DateFormat.jm().format(now);
    // }
    }catch(e){
      print('caught error is : $e');
      time = 'could not get time data';
    }

  }

}
