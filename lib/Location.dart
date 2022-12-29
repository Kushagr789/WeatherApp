import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/Service/data.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String Temperature="";
  String Real="";
  String Speed="";
  String Sunset="";
  String Sunrise="";
  String Humidity="";
  String MinT="";
  String MaxT="";
  String Pressure="";
  String City="";
  String Rain="";
  String Main="";
  String AQI="";

  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async{
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled=await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location services are disabled.Please enable the services'))
      );
      return false;
    }

    permission=await Geolocator.checkPermission();
    if(permission==LocationPermission.denied){
      permission=await Geolocator.requestPermission();
      if(permission==LocationPermission.denied){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied'))
        );
        return false;
      }
    }
    if(permission==LocationPermission.deniedForever){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permissions are permanently denied, we cannot request permissions.'))
      );
      return false;
    }
    return true;
  }
  Future<void> _getCurrentPosition() async{
    final hasPermission=await _handleLocationPermission();

    if(!hasPermission) return;
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium
    ).then((Position position) {
      setState(() => _currentPosition=position,);
      _getAddressFromLatLng(_currentPosition!);
    },).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.locality}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  void start(String? location) async
  {
    Data1 instance1=Data1(location: location);
    await instance1.get1();
    if(this.mounted)
    {
      setState(() {
        Temperature=instance1.temp;
        Real=instance1.real;
        Speed=instance1.windspeed;
        Sunrise=instance1.sunrise;
        Sunset=instance1.sunset;
        Humidity=instance1.humidity;
        Pressure=instance1.pressure;
        City=instance1.city;
        Main=instance1.main;
        AQI=instance1.Aqi;
        
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _getCurrentPosition();
    start(_currentAddress);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  Container(
      height: size.height,
      width: size.width,
      color: Colors.black,
      child: Stack(
        children: [
          WeatherBg(weatherType: WeatherType.hazy, width: size.width, height: size.height),
          NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              collapsedHeight: size.height*0.5,
              expandedHeight: size.height*0.6,
              floating: false,
              pinned: false,
              toolbarHeight: size.height*0.1,
              backgroundColor: Color.fromRGBO(0, 0, 0, 0),
              flexibleSpace: Container(
          height: size.height*0.5,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: size.height*0.1,),
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.locationCrosshairs,size: 18,color: Colors.black,),
              Text('Your Location Now',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                  
                ),
              )
            ],
          ),
              SizedBox(height: size.height*0.01,),
              SizedBox(height: 15,),
          
              Text(City,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: size.height*0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Temperature,
                style: TextStyle(
                  fontSize: 130,
                  
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text(' \u00B0C',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              
                ],
              )
                ],
              ),
              SizedBox(height: size.height*0.01,),
              Opacity(opacity: 0.4,
              child: Container(
                
                width: size.width*0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(Main,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),),
              
              
            ],
          ),
        )
            ),
            
          ];
        }), 
        body: SingleChildScrollView(
          child: Container(
            height: size.height*0.5,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Opacity(opacity: 0.4,
                
                child: Container(
                  width: size.width,
                  height: size.height*0.4,
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height*0.13,
                        width: size.width,
                        
                        margin: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Sunrise $Sunrise',style: TextStyle(color: Colors.white,fontSize: 17),),
                                Text('Sunset $Sunset',style: TextStyle(color: Colors.white,fontSize: 17),),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: size.height*0.25,
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: size.height*0.25,
                            
                              width: size.width*0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Real feel',style: TextStyle(fontSize: 15,color: Colors.grey),),
                                      Text('$Real\u00B0C',style: TextStyle(color: Colors.white,fontSize: 25),)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Chance of rain',style: TextStyle(fontSize: 15,color: Colors.grey),),
                                      Text('0%',style: TextStyle(color: Colors.white,fontSize: 25),)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Wind Speed',style: TextStyle(fontSize: 15,color: Colors.grey),),
                                      Text('${Speed}km/h',style: TextStyle(color: Colors.white,fontSize: 25),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height*0.25,
                              
                              width: size.width*0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Humidity',style: TextStyle(fontSize: 15,color: Colors.grey),),
                                      Text('$Humidity%',style: TextStyle(color: Colors.white,fontSize: 25),)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Pressure',style: TextStyle(fontSize: 15,color: Colors.grey),),
                                      Text('${Pressure}mbar',style: TextStyle(color: Colors.white,fontSize: 25),)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('AQ index',style: TextStyle(fontSize: 15,color: Colors.grey),),
                                      Text(AQI,style: TextStyle(color: Colors.white,fontSize: 25),)
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),)
              ]
            ),
          )
        )
      )
        ],
      )
    );
    
  }
}