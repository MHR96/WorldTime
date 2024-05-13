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
    data = data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    //print(data?['location']);

    //set background
    String bgImage = data['isDayTime'] ? 'dayy.jpg' : 'nightt.jpg';
    Color? bgColor = data['isDayTime']
        ? const Color.fromRGBO(29, 157, 218, 1)
        : const Color.fromRGBO(38, 36, 49, 1);
    Color? fontColor = data['isDayTime'] ? Colors.white : Colors.white24;

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
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');

                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'day': result['day'],
                        'isDayTime': result['isDayTime'],
                      } ;
                    });
                  },
                  icon: const Icon(Icons.edit_location, color: Colors.white24),
                  label: const Text('choose location'),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data?['location'],
                      style: const TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 20.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ]),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(data?['time'],
                    style: const TextStyle(
                        fontSize: 66.0,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.0, 0.0),
                            blurRadius: 20.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
