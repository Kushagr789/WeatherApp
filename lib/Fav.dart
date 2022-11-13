import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Fav extends StatefulWidget {
  const Fav({super.key});

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
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
        body: Container(
          color: Color.fromARGB(255, 11, 0, 34),
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            children: [
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
                                  Text('20\u00B0',
                                    style: TextStyle(fontSize: 45,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,),
                                  ),
                                  Text('Delhi',
                                    style: TextStyle(fontSize: 22,
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
                                  Icon(FontAwesomeIcons.moon,color: Colors.blue,size: 70,)
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
    );
  }
}