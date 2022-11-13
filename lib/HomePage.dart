import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              collapsedHeight: size.height*0.2,
              expandedHeight: size.height*0.3,
              floating: false,
              pinned: false,
              toolbarHeight: size.height*0.1,
              backgroundColor: Color.fromRGBO(0, 0, 0, 0),
              flexibleSpace: Container(
              
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ghaziabad',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text('23',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text('haze',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text('H:29 L:21',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                  ],
                ),
              )
            ),
            
          ];
        }), 
        body: SingleChildScrollView(
          child: Container(
            height: size.height*2,
            color: Colors.pink,
          ),
        )
      
    );
  }
}