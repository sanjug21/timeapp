import 'package:timeapp/services//worldtime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  String time='Loading';

  void setupWorldtime() async{
    WorldTime instance=WorldTime(location: 'India',flag: 'India.png', url: 'Asia/Kolkata');
    await instance.getDate();
    Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: {'location':instance.location,'flag':instance.flag,'time':instance.time,'isDateTime':instance.isDayTime});

    // print(instance.time);
    // setState(() {
    //   time=instance.time;
    // });
  }
  @override
  void initState(){
    super.initState();
    setupWorldtime();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[300],
      body:const Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50,
        ),
      )

    );
  }
}
