import 'dart:io';
import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:ealmashi/features/Screen/login/mainlog/mainlogscreen.dart';
import 'package:ealmashi/features/Screen/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:ui'as ui;

class ResetSuccScreen extends StatefulWidget {

  ResetSuccScreen({Key? key}) : super(key: key);

  @override
  _ResetSuccScreenState createState() => _ResetSuccScreenState();
}

class _ResetSuccScreenState extends State<ResetSuccScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                            height: 46.h,
                            width: 84.w,
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 0.6.sw,
                          height: 46.h,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2,
                                      color: Colors.grey.shade400))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainLog()));
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    textDirection: ui.TextDirection.ltr,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.2.sh,
                ),
                Column(
                  children: [
                    Container(
                      height: 92.h,
                      width: 92.w,
                      child:Icon(Icons.check,color: Colors.white,size: 81.w,),
                      decoration: BoxDecoration(
                        color: LightThemeColors.whatsApp, shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("شكرا لك",
                        style: TextStyle(
                            fontSize: 35.sp, color: LightThemeColors.primaryColor)),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text("سيتم مراجعة الطلب الرجاء انتظار البريد الالكتروني للإعادة تعيين كلمة المرور " ,style: TextStyle(
                            fontSize: 14.sp, color: LightThemeColors.lightGreyShade)),
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Container(
                      height: 56.h,
                      width: 250.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                        color: LightThemeColors.whatsApp,),
                      child: RaisedButton(
                        color: LightThemeColors.whatsApp,
                        onPressed: (){

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainLog()));
                        },
                        child: Text("الرجوع لتسجيل الدخول",style: TextStyle(color: LightThemeColors.backgroundColor,fontSize: 18.sp),),
                      ),
                    )
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }


}

