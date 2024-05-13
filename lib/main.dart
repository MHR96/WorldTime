import 'package:flutter/material.dart';
import 'package:world_time1/pages/choose_location.dart';
import 'package:world_time1/pages/home.dart';
import 'package:world_time1/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      },
    ));
