import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class Today{
  String time,icon,temp;
  Today(
    {required this.icon,required this.temp,required this.time}
  );
}
List<Today>today=[
  Today(icon: "sun", temp: "27\u00B0", time: "12PM"),
  Today(icon: "sun", temp: "27\u00B0", time: "01PM"),
  Today(icon: "sun", temp: "28\u00B0", time: "02PM"),
  Today(icon: "sun", temp: "28\u00B0", time: "03PM"),
  Today(icon: "suncloud", temp: "27\u00B0", time: "04PM"),
  Today(icon: "cloud", temp: "26\u00B0", time: "05PM"),
  Today(icon: "cloud", temp: "25\u00B0", time: "06PM"),
  Today(icon: "moon", temp: "23\u00B0", time: "07PM"),
];

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
     color: Color.fromARGB(255, 11, 0, 34),
     height: size.height,
     width: size.width,
     padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 10),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: size.height*0.5,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: size.height*0.05,),
              Text('Ghaziabad',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text('27\u00B0',
                style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                
                width: size.width*0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple,
                ),
                child: Center(
                  child: Text('Cloudy',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
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
                      Text('13%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.droplet,
                        color: Colors.blue,
                        size: 20,
                      ),
                      Text('0.533 mBar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
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
                        size: 20,
                      ),
                      Text('9km/h',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.sun,size: 25,color: Colors.yellow,
                  ),
                  Text('07:00AM',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('06:00PM',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),Icon(
                    FontAwesomeIcons.moon,size: 25,color: Colors.yellow,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          height: size.height*0.41,
          width: size.width,
          
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Today',
                style: TextStyle(fontSize: 25,color: Colors.white),
              ),
              Container(
                height: size.height*0.15,
                width: size.width,
                
                child: ListView.builder(
                  itemCount: 8,scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        height: size.height*0.15,
                        width: size.width*0.19,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(today[index].time,style: TextStyle(fontSize: 20,color: Colors.white),),
                            Icon(FontAwesomeIcons.cloudSun,size: 30,color: Colors.yellow,),
                            Text(today[index].temp,style: TextStyle(fontSize: 35,color: Colors.white),)

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: size.height*0.215,
                width: size.width,
          
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      height: size.height*0.06,
                      width: size.width,
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tuesday',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                          Icon(FontAwesomeIcons.cloudMoon,size: 25,color: Colors.yellow,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('19\u00B0',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                              Text('15\u00B0',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        
      ],
     ),
     
    );
  }
}
