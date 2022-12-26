

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
  String Aqi="";
  List<String> L=[];
  List<String> dt=[];
  List<String> ic=[];
  List<String> min=[];
  List<String> max=[];
  List<String> ic1=[];
  List<String> dt1=[];

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
    String gair_speed=(wind['speed']*3.6).toStringAsFixed(1);
    Map sun=data['sys'];
    int grise=sun['sunrise'];
    DateTime b=DateTime.fromMillisecondsSinceEpoch(grise*1000);
    String gsunrise=(b.hour).toString()+':'+(b.minute).toString();
    int gset=sun['sunset'];
    DateTime a=DateTime.fromMillisecondsSinceEpoch(gset*1000);
    //DateTime a=DateTime.now();
    //Duration d=a.difference(b);
    //String gsr=((d.inHours%24).toString())+':'+((d.inMinutes%60).toString());
    
    
    String gsunset=(a.hour).toString()+':'+(a.minute).toString();
    Map cord=data['coord'];
    double lat=cord['lat'];
    double lon=cord['lon'];
    Response response3=await get(Uri.parse('http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=1befebc0c18af2890ed719c8b680c70d'));
    Map data3=jsonDecode(response3.body);
    List x=data3['list'];
    Map y=x[0];
    String aqi=(y['main']['aqi']).toString();
    List weather=data['weather'];
    
    Map w=weather[0];
    String gmain=w['main'];

    
    Response response1=await get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=1befebc0c18af2890ed719c8b680c70d'));
    Map data1=jsonDecode(response1.body);
    List abc=data1['list'];
    
    List ab=[
       abc[0],
       abc[1],
       abc[2],
       abc[3],
       abc[4],
       abc[5],
       abc[6],
       abc[7],
       abc[8],
       abc[9],
    ];
    List<String> l=[];
    for(int i=0;i<10;i++)
    {
      Map m=(abc[i])['main'];
      L.add((m['temp']-273.0).round().toString());
      int d=(abc[i])['dt'];
      DateTime d1=DateTime.fromMillisecondsSinceEpoch(d*1000);
      dt.add((d1.hour).toString()+':'+(d1.minute).toString());
      List w=(abc[i])['weather'];
      String ico =w[0]['icon'];
      ic.add('http://openweathermap.org/img/w/'+ico+'.png');

    }


    Response response2=await get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=1befebc0c18af2890ed719c8b680c70d'));
    Map data2=jsonDecode(response2.body);
    List xyz=data2['list'];
    List xy=[
      xyz[0],
      xyz[8],
      xyz[16],
      xyz[24],
      xyz[32],
    ];
    for(int i=0;i<=33;i=i+8)
    {
      Map m=(xyz[i])['main'];
      min.add((m['temp_min']-273.0).round().toString());
      max.add((m['temp_max']-273.0).round().toString());
      List w=(xyz[i])['weather'];
      String ico1 =w[0]['icon'];
      ic1.add('http://openweathermap.org/img/w/'+ico1+'.png');

      int e=(xyz[i])['dt'];
      DateTime d2=DateTime.fromMillisecondsSinceEpoch(e*1000);
      dt1.add((d2.day).toString()+'/'+(d2.month).toString()+'/'+(d2.year).toString());
    }

    

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
    main=gmain;
    Aqi=aqi;
    
                  
    
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
    main="0";
    }
  }
}

