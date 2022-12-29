import 'package:flutter/material.dart';
import 'Service/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_icons/weather_icons.dart';

class HomePage extends StatefulWidget {
   String city;
   HomePage({super.key,required this.city});

  @override
  State<HomePage> createState() => _HomePageState(City: city);
}

class _HomePageState extends State<HomePage> {
   _HomePageState({required this.City});

TextEditingController searchController =new TextEditingController();
  

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
  List<String>Temp=[];
  List<String>Time=[];
  List<String>IC=[];
  List<String>IC1=[];
  List<String>MIN=[];
  List<String>MAX=[];
  String icon="sun";
  List<String>Day=[];
  
  
  
  void startApp(String loc) async
  {
    Data instance = Data(location: loc);
    await instance.getData();
    if(this.mounted)
    {
      setState(() {
      Temperature=instance.temp;
    Real=instance.realFeel;
    Speed=instance.air_speed;
    Sunrise=instance.sunrise;
    Sunset=instance.sunset;
    Humidity=instance.humidity;
    MinT=instance.minT;
    MaxT=instance.maxT;
    Pressure=instance.pressure;
    City=instance.name;
    Main=instance.main;
    Temp=instance.L;
    Time=instance.dt;
    IC=instance.ic;
    IC1=instance.ic1;
    MAX=instance.max;
    MIN=instance.min;
    Day=instance.dt1;
    AQI=instance.Aqi;
    //IC=instance.ic;
    });
    
    }
    
  }
  
  @override
  void initState() {
    // TODO: implement initState
    startApp("Ghaziabad");
    super.initState();
  }
  @override
  
  
  @override
  Widget build(BuildContext context) {
    
    
    final size=MediaQuery.of(context).size;
    return  Container(
      height: size.height*2,
      width: size.width,
      
      child: Stack(
        children: [
          Image.asset('assets/images/night.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,

          ),
          NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              collapsedHeight: size.height*0.5,
              expandedHeight: size.height*0.65,
              floating: false,
              pinned: false,
              toolbarHeight: size.height*0.1,
              backgroundColor: Color.fromRGBO(0, 0, 0, 0),
              flexibleSpace: Container(
          height: size.height*0.7,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: size.height*0.01,),
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
                    ),
                    GestureDetector(
                      onTap: () {
                        startApp(searchController.text);
                        
                      },
                      child: Icon(Icons.search,color: Colors.blue,size: 30,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height*0.05,),
              Text(City,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
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
              Container(
                
                width: size.width*0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple,
                ),
                child: Center(
                  child: Text('$Main',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),
              
              
            ],
          ),
        )
            ),
            
          ];
        }), 
        body: SingleChildScrollView(
          child: Container(
            height: size.height-0.95,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: size.width,
                  height: size.height*0.4,
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 11, 0, 34),
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
                ),
                Container(
                height: size.height*0.15,
                width: size.width,
                
                child: ListView.builder(
                  itemCount: IC.length,scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        height: size.height*0.15,
                        width: size.width*0.23,
                        color: Color.fromARGB(255, 11, 0, 34),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(Time[index],style: TextStyle(fontSize: 20,color: Colors.white),),
                            Image.network(IC[index]),
                            Text('${Temp[index]}\u00B0',style: TextStyle(fontSize: 35,color: Colors.white),)

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: size.height*0.35,
                width: size.width,
                
          
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemCount: Day.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: size.height*0.06,
                      width: size.width,
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Day[index],
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                          Image.network(IC1[index]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('${MIN[index]}\u00B0',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                              Text('${MAX[index]}\u00B0',
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
        )
      
    ),
        ],
      )
    );
  }
}