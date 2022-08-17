import 'dart:async';
import 'package:ealmashi/features/Screen/pages/pages.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:ealmashi/Globals.dart';
import 'package:ealmashi/features/Screen/login/mainlog/mainlogscreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ealmashi/features/Screen/pageviewscreen.dart';

import '../../../Preference.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    startTimer();
  }

  late Timer _timer;
  int _start = 5  ;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });

          Global.userToken = Preferences.getUserToken();
          Global.userID = Preferences.getId();
          Global.userName = Preferences.getName();
          Global.subEnd = Preferences.getSubEnd();
          Global.subStatus = Preferences.getSubStatus();
          Global.subName = Preferences.getSubName();
          bool? firstTime = Preferences.getIsFirstTime();
          Global.isUser=Preferences.getIsUser();
          print( Global.userToken);
          print( Global.userID);
          print( Global.isUser);
          if (Global.userToken!.length > 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>
                  Pages(pageNumber: 0)),
            );
          }
          else  if (firstTime) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PageViewScreen()),
              );
            }
          else
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainLog()),
          );
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
           child: Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
