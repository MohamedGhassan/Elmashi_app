import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';

class Verify2Screen extends StatefulWidget {
  const Verify2Screen({Key? key}) : super(key: key);

  @override
  _Verify2ScreenState createState() => _Verify2ScreenState();
}

class _Verify2ScreenState extends State<Verify2Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
                height: 680.h,
                child: Image.asset(
                  "assets/images/background_login.png",
                  fit: BoxFit.cover,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: LightThemeColors.backgroundColor,
                      borderRadius: BorderRadius.circular(30)),
                  height: 0.38.sh,
                  width: 0.85.sw,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: SvgPicture.asset('assets/icons/FontAwsome (check).svg',height: 22.h,),
                        height: 70.h,
                        decoration: BoxDecoration(
                            color: LightThemeColors.whatsApp,
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text("شكرا لك",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                              fontSize: 28.sp,
                              color: LightThemeColors.primaryColor)),
                      Text("تم التحقق بنجاح",style: TextStyle(fontSize: 12.sp),),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(

                        color: LightThemeColors.whatsApp,
                        height: 40.h,
                        width: 180.w,
                        child: RaisedButton(
                          color: LightThemeColors.whatsApp,
                          onPressed: () {},
                          child: Text(
                            "الصفحة الرئيسية",
                            style: TextStyle(
                                color: LightThemeColors.backgroundColor,
                                fontSize: 12.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
