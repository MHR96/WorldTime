import 'package:flutter/material.dart';
import 'package:world_time1/services/get_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

Timer? timer;


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Australia/Sydney');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'day': instance.day,
      'isDayTime': instance.isDayTime,
    });


  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => setupWorldTime());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body:  const Center(
      child: SpinKitFadingGrid(
        color: Colors.white,
        size: 50.0,
      ),
    ),
    );
  }
}
