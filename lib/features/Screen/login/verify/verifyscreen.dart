import 'package:ealmashi/features/Screen/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    final AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        height: 220.h,
        width: 250.w,
        child: Column(
          children: [
            Container(
              height: 70.h,
              child: SvgPicture.asset('assets/icons/FontAwsome (check).svg',height: 22.h,),
              decoration: BoxDecoration(
                  color: LightThemeColors.whatsApp, shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text("شكرا لك",
                style: TextStyle(
                    fontSize: 35.sp, color: LightThemeColors.primaryColor)),

            Text("سيتم مراجعة الطلب وبعد التحقق سيتم تفعيل الاشتراك وسيتم اشعارك عبر الاشعارات والملف الشخصي" ,style: TextStyle(
                fontSize: 14.sp, color: LightThemeColors.lightGreyShade)),
            SizedBox(height: 5.h,),
            Container(
              color: LightThemeColors.whatsApp,
              height: 35.h,
              width: 150.w,
              child: RaisedButton(
                color: LightThemeColors.whatsApp,
                onPressed: (){

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Pages(pageNumber: 0)));
                },
                child: Text("الصفحة الرئيسية",style: TextStyle(color: LightThemeColors.backgroundColor,fontSize: 18.sp),),
              ),
            )
          ],
        ),
      ),
    );
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Stack(
          children: [
            SizedBox(
                height: 680.h,
                child: Image.asset(
                  "assets/images/background_login.png",
                  fit: BoxFit.cover,
                )),
            SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.symmetric(vertical: 0.05.sh),
              height: 680.h,
              width: double.infinity,
              color: LightThemeColors.coverColor,
              child: Column(
                children: [
                  SizedBox(
                      height: 270.h,
                      child: SvgPicture.asset("assets/images/logo.svg")),
                  Text(
                    "ادخل رقم الكود المرسل",
                    style: TextStyle(
                        color: LightThemeColors.primaryColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        height: 55.h,
                        width: 62.w,
                        decoration: BoxDecoration(
                            color: LightThemeColors.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                              color: LightThemeColors.backgroundColor),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        height: 55.h,
                        width: 62.w,
                        decoration: BoxDecoration(
                            color: LightThemeColors.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                              color: LightThemeColors.backgroundColor),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        height: 55.h,
                        width: 62.w,
                        decoration: BoxDecoration(
                            color: LightThemeColors.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                              color: LightThemeColors.backgroundColor),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Container(
                        height: 55.h,
                        width: 62.w,
                        decoration: BoxDecoration(
                            color: LightThemeColors.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                              color: LightThemeColors.backgroundColor),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 65.h,
                  ),
                  SizedBox(
                    width: 0.75.sw,
                    height: 0.06.sh,
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext ctx) {
                                return alert;
                              });
                        },
                        child: Text(
                          "تحقق",
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: LightThemeColors.blackColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45)))),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
