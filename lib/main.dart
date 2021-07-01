import 'package:flutter/material.dart';
import 'package:flutter_weather_app/body.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Weather(),
    );
  }
}
class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}


class _WeatherState extends State<Weather> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          leading:Icon(
            FontAwesomeIcons.cloud
          ),
          title: Text("Weather App",
          style: TextStyle(
              fontSize: 24,
          ),
          ),
        ),
        body: SingleChildScrollView(
          child: Body(),
        )
      ),
    );
  }
}




