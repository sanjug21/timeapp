import 'package:flutter/material.dart';
import 'package:timeapp/services/worldtime.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> location=[
    WorldTime(location: 'India',flag: 'india.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'USA',flag: 'USA.png', url: 'Etc/GMT-14'),
    WorldTime(location: 'Australia',flag: 'Australia.png', url: 'Australia/Brisbane'),
    WorldTime(location: 'England',flag: 'England.png', url: 'Europe/London'),
    WorldTime(location: 'Japan',flag: 'Japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Thailand',flag: 'Thailand.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'Sri Lanka',flag: 'Sri Lanka.png', url: 'Asia/Colombo'),
    WorldTime(location: 'Russia',flag: 'Russia.png', url: 'Europe/Moscow'),
    WorldTime(location: 'France',flag: 'France.png', url: 'Europe/Paris'),
    WorldTime(location: 'UAE',flag: 'UAE.jpeg', url: 'Asia/Dubai')
  ];
  void updateTime(index)async{
    WorldTime instance=location[index];
    await instance.getDate();
    Navigator.popAndPushNamed(
        context,
        '/home',
        arguments: {'location':instance.location,'flag':instance.flag,'time':instance.time,'isDateTime':instance.isDayTime}
    );

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title:const Text('Choose Location'),
        centerTitle: true,
      ),
      body:Container(
        color: Colors.blue[100],
        child: ListView.builder(
            itemCount: location.length,
            itemBuilder:(context,index){
              return Padding(

                padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
                child: Card(
                    color: Colors.blue[50],
                  child: ListTile(
                    onTap: (){
                      updateTime(index);

                    },
                    title: Text(location[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('image/${location[index].flag}'),
                    ),
                  ),
                ),
              );

     },

        ),
      )
    );
  }
}
