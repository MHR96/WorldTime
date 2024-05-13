import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // Location name for the UI
  String time = ''; // location time
  String flag; // URL to the flag
  String url; // URL for location API
  bool isDayTime = false;
  String day = ''; //day of the week for the location
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    //making request
    try {
      Response response = await get(Uri(
          scheme: 'http', host: 'worldtimeapi.org', path: 'api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);

      isDayTime = now.hour> 6 && now.hour <20? true: false;

      // Calculating day of the week
      String dayWeek = (data['day_of_week'] + 1).toString();
      switch (dayWeek) {
        case '1':
          day = 'Sunday';
        case '2':
          day = 'Monday';
        case '3':
          day = 'Tuesday';
        case '4':
          day = 'Wednesday';
        case '5':
          day = 'Thursday';
        case '6':
          day = 'Friday';
        case '7':
          day = 'Saturday';
      }
      //DateTime today = DateTime.parse(dayWeek);
      //day = today.toString();
      //print(day);
    } catch (e) {
      print(e);
    }
  }
}
