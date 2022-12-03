

import 'dart:convert';

import 'package:http/http.dart';

class Data
{
  
  String location;
  String temp="";
  String humidity="";
  String main="";
  String description="";
  String sunrise="";
  String sunset="";
  String realFeel="";
  String rain="";
  String uv="";
  String pressure="";
  String minT="";
  String icon="";
  String maxT="";
  String air_speed="";
  String city="Delhi";
  String name="";

  Data({required this.location})
  {
    location=this.location;
  }
  Future<void> getData() async
  {
    try
    {
      Response response =await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=1befebc0c18af2890ed719c8b680c70d'));
    Map data =jsonDecode(response.body);
    Map temp_data=data['main'];
    String gtemp=((temp_data['temp']-273.0).round()).toString();
    String grealFeel=((temp_data['feels_like']-273).round()).toString();
    String ghumidity=temp_data['humidity'].toString();
    String gpressure=temp_data['pressure'].toString();
    String gminT=((temp_data['temp_min']-273).round()).toString();
    String gmaxT=((temp_data['temp_max']-273).round()).toString();
    String gcity=data['name'];
    Map wind=data['wind'];
    String gair_speed=wind['speed'].toString();
    Map sun=data['sys'];
    String gsunrise=sun['sunrise'].toString();
    String gsunset=sun['sunset'].toString();
    Map cord=data['coord'];
    double lat=cord['lat'];
    double lon=cord['lon'];
    

    
    

    temp=gtemp;
    realFeel=grealFeel;
    humidity=ghumidity;
    pressure=gpressure;
    minT=gminT;
    maxT=gmaxT;
    air_speed=gair_speed;
    sunrise=gsunrise;
    sunset=gsunset;
    name=gcity;
    
    }catch(e)
    {
      temp="";
    realFeel="";
    humidity="";
    pressure="";
    minT="";
    maxT="";
    air_speed="";
    sunrise="";
    sunset="";
    }
  }
}

