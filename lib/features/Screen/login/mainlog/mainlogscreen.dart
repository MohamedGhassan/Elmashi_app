import 'package:ealmashi/features/Screen/loginScreen/loginScreen.dart';
import 'package:ealmashi/features/Screen/register/registerScreen.dart';
import 'package:ealmashi/features/Screen/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';

class MainLog extends StatefulWidget {
  const MainLog({Key? key}) : super(key: key);

  @override
  _MainLogState createState() => _MainLogState();
}

class _MainLogState extends State<MainLog> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                    height: 230,
                    child: Image.asset("assets/images/logo.png")),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "مرحبا بكم في عالماشي",
                  style: TextStyle(
                      color: LightThemeColors.lightBrownColor,
                      fontSize: 21.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 0.75.sw,
                  height: 0.06.sh,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));


                      },
                      child: Text(
                        "دخول",
                        style: TextStyle(fontSize: 18.sp,
                        color: Colors.white
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: LightThemeColors.secondColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45)))),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 0.75.sw,
                  height: 0.06.sh,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                      },
                      child: Text(
                        "تسجيل",
                        style: TextStyle(fontSize: 18.sp,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: LightThemeColors.secondColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45)))),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 0.75.sw,
                  height: 0.06.sh,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Pages(pageNumber: 0,)));


                      },
                      child: Text(
                        "تخطي",
                        style: TextStyle(fontSize: 18.sp,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: LightThemeColors.blackColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45)))),
                ),
              ],
            )),
      ),
    ));
  }
}
