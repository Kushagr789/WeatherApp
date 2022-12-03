import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/First.dart';
import 'package:weatherapp/HomePage.dart';
import 'package:weatherapp/Service/data.dart';
class Fav extends StatefulWidget {
  const Fav({super.key});

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  First f=new First();
  TextEditingController searchController =new TextEditingController();
  
  String Temperature="";
  String Rain="";
  String Humidity="";
  String Speed="";
  void startApp(String loc,int index) async
  {
    Data instance = Data(location: City[index].name);
    await instance.getData();
    if(this.mounted)
    {
      setState(() {
      City[index].Temperature=instance.temp;
    City[index].Humidity=instance.humidity;
    City[index].Speed=instance.air_speed;
    
    });
    }
    
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 11, 0, 34),
          elevation: 0,
          
        ),
        body: SingleChildScrollView(
          child: Container(
          color: Color.fromARGB(255, 11, 0, 34),
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            children: [
              Container(
                height: size.height*0.06,
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 1,vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black),
                  color: Colors.white
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        
                        
                      },
                      child: Icon(Icons.search,color: Colors.blue,size: 30,),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        style: TextStyle(fontSize: 22,),
                        decoration: InputDecoration(
                          hintText: 'Search any city',
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: 20,color: Colors.black54)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: size.height*0.62,
                width: size.width,
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 12

                  ),
                  itemBuilder: (context, index) {
                    startApp(City[index].name,index);
                    return Container(
                      height: size.height*0.2,
                      width: size.width*0.4,
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 40, 67, 81),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('${City[index].Temperature}\u00B0',
                                    style: TextStyle(fontSize: 35,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,),
                                  ),
                                  Text('${City[index].name}',
                                    style: TextStyle(fontSize: 20,
                                    color: Colors.white,),
                                  ),
                                  Text('IN',
                                    style: TextStyle(fontSize: 20,
                                    color: Colors.blue,),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(FontAwesomeIcons.moon,color: Colors.blue,size: 55,)
                                ],
                              )
                            ],
                          ),
                          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.droplet,
                        color: Colors.blue,
                        size: 20,
                      ),
                      Text('${City[index].Humidity}%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.wind,
                        color: Colors.blue,
                        size: 10,
                      ),
                      Text('${City[index].Speed} km/h',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  
                  
                  
                ],
              ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          
        ),
      ),
    ),
        );
  }
}
class city{
  String name;
  String Temperature;
  String Speed;
  String Humidity;
  city({required this.name,required this.Temperature,required this.Humidity,required this.Speed});
}
List<city>City=[
  city(name: "Delhi", Temperature: "", Humidity: "", Speed: ""),
  city(name: "Mumbai", Temperature: "", Humidity: "", Speed: ""),
  city(name: "Kolkata", Temperature: "", Humidity: "", Speed: ""),
  city(name: "Bangalore", Temperature: "", Humidity: "", Speed: ""),
  city(name: "Chennai", Temperature: "", Humidity: "", Speed: ""),
  city(name: "Pune", Temperature: "", Humidity: "", Speed: ""),
];