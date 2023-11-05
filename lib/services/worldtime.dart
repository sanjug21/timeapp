import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart';
class WorldTime {
  String location; //Location name for ui
  String time='';//time at that location
  String flag; //url for icon
  String url; //location url for end point
  bool isDayTime=true;
  WorldTime({required this.location, required this.flag, required this.url});

Future<void> getDate () async {
  try{

    //make a request
    Response responses = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(responses.body);

    // det data from data
    String dateTime=data['datetime'];
    String offset=data['utc_offset'];


    DateTime now=DateTime.parse(dateTime);
    now=now.add(Duration(hours:int.parse(offset.substring(1,3)) ));
    now=now.add(Duration(minutes: int.parse(offset.substring(4,6))));
    // set the time property
    isDayTime=now.hour>6 && now.hour<20? true:false;
    time=DateFormat.jm().format(now);

  }
  catch(e){
    // print ('Error Caught');
    time='Oops, You are offline';
  }
}

}


//     // stimulate network to get user name
//     String UserName =await Future.delayed( const Duration(seconds: 3),(){
//       return 'Sanju';
//     });
//
// //Stimulate network to get the bio
//     String bio=await Future.delayed( const Duration(seconds: 2),(){
//       return 'Its just a matter of time';
//     });
//     print('$UserName -  $bio');

