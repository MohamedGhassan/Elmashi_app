import 'package:ealmashi/features/Screen/login/mainlog/mainlogscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';

import '../../../Preference.dart';

class OnBorder2 extends StatefulWidget {
  final int currentIndex;

  const OnBorder2(this.currentIndex, {Key? key}) : super(key: key);

  @override
  _OnBorder2State createState() => _OnBorder2State();
}

class _OnBorder2State extends State<OnBorder2> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: LightThemeColors.lightYellowColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)));

    return SafeArea(
        child: Scaffold(
          body: Stack(
              children:[
                Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().screenHeight,
                    child: Image.asset("assets/images/backgroundOnbroder.png",fit: BoxFit.fill,)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 18.w),
                                child: Column(
                                  children: [

                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Stack(
                                        alignment: Alignment.center,
                                      children:[
                                        Container(
                                          height: 285.h,
                                          child: Image.asset("assets/images/onborder2-1.png")),
                                         Container(
                                          width: 135.w,
                                            height: 125.h,
                                            child: Image.asset("assets/images/onborder2-2.png")),
                                    ]),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "?????? ???????? ?????????????? ????????",
                                style: TextStyle(
                                    fontFamily: "Bukra",
                                    fontSize: 19.sp,
                                    color: LightThemeColors.lightBrownColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "???????? ???????????????? ???? ??????????????",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontFamily: "Nahdi",
                                    color: LightThemeColors.lightRedColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "?????????? ?????????? ??????????????",
                                style: TextStyle(
                                    fontFamily: "Bukra",
                                    fontSize: 19.sp,
                                    color: LightThemeColors.lightBrownColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildCircle(widget.currentIndex == 0
                                      ?LightThemeColors.lightBrownColor
                                      : LightThemeColors.lightGreyShade400),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  buildCircle(widget.currentIndex == 1
                                      ? LightThemeColors.lightBrownColor
                                      : LightThemeColors.lightGreyShade400),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  buildCircle(widget.currentIndex == 3
                                      ?LightThemeColors.lightBrownColor
                                      : LightThemeColors.lightGreyShade400),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: 140.w,
                                height: 45,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Preferences.saveIsFirstTime(false);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLog()));
                                    },
                                    child: Text(
                                      "????????",
                                      style: TextStyle(
                                        fontSize: 21.sp,
                                        fontFamily: "Nahdi",
                                        color: LightThemeColors.lightBrownColor,

                                      ),
                                    ),
                                    style: style),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]
          ),
        ));
  }

  Container buildCircle(Color color) {
    return Container(
      height: 4.h,
      width: 16.w,
      decoration:
      BoxDecoration(shape: BoxShape.rectangle, color: color),
    );
  }
}
