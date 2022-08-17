import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return LightThemeColors.backgroundColor;
    }
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
              child:Column(
                children: [
                  SizedBox(height: 150.h,),
                  SizedBox(
                      height: 92.h,
                      width: 168.w,
                      child: Image.asset("assets/images/logo.png")),
                  SizedBox(height: 20.h,),
                  Text(
                    "دخول الأعضاء",
                    style: TextStyle(
                        color: LightThemeColors.primaryColor,
                        fontSize: 21.sp,
                        fontFamily: "Noto",
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  Container(

                    width: 0.9.sw,
                    height: 0.05.sh,
                    child: TextField(
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(18.sp),
                          color: LightThemeColors.textColor),
                      decoration: InputDecoration(
                        prefixIcon:  Padding(
                            padding: EdgeInsets.all(10), // add padding to adjust icon
                            child: SvgPicture.asset('assets/icons/mail.svg')),
                        contentPadding: EdgeInsets.all(8),
                        hintText: "البريد الالكتروني",
                        hintStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(

                    width: 0.9.sw,
                    height: 0.05.sh,
                    child: TextField(
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(18.sp),
                          color: LightThemeColors.textColor),
                      decoration: InputDecoration(
                        prefixIcon:  Padding(
                            padding: EdgeInsets.all(10), // add padding to adjust icon
                            child: SvgPicture.asset('assets/icons/unlock.svg')),
                        contentPadding: EdgeInsets.all(8),
                        hintText: "كلمة المرور",
                        hintStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            print(isChecked);
                            isChecked = !isChecked;
                          });
                        },
                        child: Checkbox(
                          checkColor:LightThemeColors.secondColor,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: ( value) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                        ),
                      ),
                      Text(
                        "نسيت كلمة المرور",
                        style: TextStyle(
                            fontFamily: 'Noto',
                            color: LightThemeColors.primaryColor,fontSize: 15.sp),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 0.7.sw,
                    height: 56.h,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "دخول",
                          style: TextStyle(
                              fontFamily: 'Noto',
                              fontSize: 21.sp,
                              color: Colors.white
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: LightThemeColors.secondColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45)))),
                  ),
                ],
              ))),
        );
  }
}
