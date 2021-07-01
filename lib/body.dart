import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseableCaed.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http ;
import 'package:http/http.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  var apiKey = '7be156f187bf9c482b57653593931c5e';
  double latitude;
  double longitude;
  String url;
  String data;
  String cityName= "Local weather";
  var temp;
  var humidity;
  var wind;
  var max;
  Future<Response>  cityData() async{
    url="https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric";
    http.Response response = await http.get(Uri.parse(url));
    data = response.body;
    dataa();
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
    getWeather();
  }

  Future<Response> getWeather() async {
    url =
    'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    http.Response response = await http.get(Uri.parse(url));
    data = response.body;
    dataa();
  }
  void dataa(){
    setState(() {
      humidity = jsonDecode(data)['main']['humidity'];
      temp = jsonDecode(data)['main']['temp'];
      wind = jsonDecode(data)['wind']['speed'];
      max = jsonDecode(data)['main']['feels_like'];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
       children:<Widget> [
         Container(
           height: 50,
          padding: EdgeInsets.only(top: 10.0),
           child: Center(
           child: Text(

             cityName,style: TextStyle(
             fontSize: 25,
             color: Colors.white,
             fontWeight: FontWeight.bold,
           ),
           ),
         ),),
         Container(
           padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
           child:
               TextField(
                 decoration: InputDecoration(
                     border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                     suffixIcon: GestureDetector(child: Icon(Icons.search,),
                       onTap: (){
                       cityData();
                       },
                     ),
                   filled: true,
                   fillColor: Colors.white,
                   focusColor: Colors.white,
                   hintText: "Enter City Name",hintStyle:KtextStylee
                 ),
                 onChanged: (value){
                  cityName=value;
                 },
               ),),
         Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(280.0)
          ),

         child:Image.asset("assets/global-warming.png",height: 200,width: 400,),
          ),
         Center(
           child: Text("$temp\u2103",style:kcenterText),
         ),
         SizedBox(height: 30,),
         Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment:MainAxisAlignment.spaceEvenly,
           children: [
            ReuseableCard(icon: FontAwesomeIcons.temperatureHigh,text: "$max pha",color: Colors.red[900],),
             ReuseableCard(icon: FontAwesomeIcons.water,text: "$humidity%",color: Colors.blue[200],),
             ReuseableCard(icon: FontAwesomeIcons.wind,text: "$wind m/s",color: Colors.white54,),
           ],
         ),
       ],
    );
  }
}

