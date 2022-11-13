import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class You extends StatefulWidget {
  const You({super.key});

  @override
  State<You> createState() => _YouState();
}

class _YouState extends State<You> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Color.fromARGB(255, 11, 0, 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.locationCrosshairs,size: 18,color: Color.fromARGB(255, 174, 173, 173),),
              Text('Your Location Now',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 174, 173, 173)
                  
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('San Fransisco, California, USA',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.solidMoon,
                size: 170,
                color: Colors.blue,
              )
              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height*0.05,
                width: size.width*0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple,
                  
                ),
                child: Center(
                  child: Text('Moonlight',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('20\u00B0C',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                ),
              )
            ],
          ),
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                  ),
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
                  
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: Container(
                  height: size.height*0.25,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Temperature',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          GestureDetector(
                            child: Row(
                              children: [
                                Text('Celcius',style: TextStyle(fontSize: 22,color: Colors.blue),),
                                Icon(FontAwesomeIcons.chevronRight,size: 25,color: Colors.white,)
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Wind Speed',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          GestureDetector(
                            child: Row(
                              children: [
                                Text('m/s',style: TextStyle(fontSize: 22,color: Colors.blue),),
                                Icon(FontAwesomeIcons.chevronRight,size: 25,color: Colors.white,)
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Source',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          GestureDetector(
                            child: Row(
                              children: [
                                Text('weather.gov',style: TextStyle(fontSize: 22,color: Colors.blue),),
                                Icon(FontAwesomeIcons.chevronRight,size: 25,color: Colors.white,)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                
                ),
              )
        ],
      ),
    );
  }
}