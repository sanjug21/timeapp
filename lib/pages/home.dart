import 'package:flutter/material.dart';
import 'package:timeapp/services/worldtime.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  void homepage() async {
  WorldTime instance=WorldTime(location: 'India',flag: 'India.png', url: 'Asia/Kolkata');
  await instance.getDate();
  Navigator.popAndPushNamed(
      context,
      '/home',
      arguments: {'location':instance.location,'flag':instance.flag,'time':instance.time,'isDateTime':instance.isDayTime}
  );
  }

  @override
  Widget build(BuildContext context) {

    data =data.isNotEmpty? data:ModalRoute.of(context)!.settings.arguments as Map<String,Object>;


    //set background
    String bgImage=data['isDateTime']?'day.jpg':'night.jpeg';
    Color? bgColor=data['isDateTime']?Colors.blue[200]:Colors.black;


    return  Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage('image/$bgImage'),
              fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
              IconButton(
              iconSize: 35,
                onPressed:() async{
                dynamic result=Navigator.popAndPushNamed(context, '/location');
                setState(() {
                  data={
                    'time':result['time'],
                    'location':result['location'],
                    'isDayTime':result['isDayTime'],
                    'flag':result['flag']

                  };
                });
                },

                icon:const Icon(
                    Icons.edit_location,
                  color: Colors.white,
                ),

              ),

                const  SizedBox(width: 1,),
                  TextButton(
                  onPressed: () async{
                    dynamic result=Navigator.popAndPushNamed(context, '/location');
                    setState(() {
                      data={
                        'time':result['time'],
                        'location':result['location'],
                        'isDayTime':result['isDayTime'],
                        'flag':result['flag']

                      };
                    });
                  },
                    child:const Text(
                        'Edit Location',
                        style:TextStyle(
                          fontSize: 25,
                          color: Colors.white,

                        )
                    ),),
              ]),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      data['location'],
                  style: const TextStyle(
                    fontSize: 30,
                    letterSpacing: 2,
                  ),
                  ),


                ],
              ),
              const SizedBox(height: 20,),
              Text(data['time'],
                style: const TextStyle(
                  fontSize: 65,
                ),
              )
            ],
        ),

          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homepage,
        backgroundColor: Colors.black,
        child: Icon(Icons.home),
      ),

      );
  }
}


