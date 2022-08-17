import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          child: Column(
            children: [
              SizedBox(height: 50.h,),
              SizedBox(
                  height: 92.h,
                  width: 168.w,
                  child: Image.asset("assets/images/logo.png")),
              SizedBox(height: 10.h,),
              Text(
                "تسجيل الاعضاء",
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
                      fontSize: ScreenUtil().setSp(18),
                      color: LightThemeColors.textColor),
                  decoration: InputDecoration(
                    prefixIcon:  Padding(
                        padding: EdgeInsets.all(10), // add padding to adjust icon
                        child: SvgPicture.asset('assets/icons/user.svg')),
                    contentPadding: EdgeInsets.all(8),
                    hintText: "الاسم",
                    hintStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        color: Colors.grey.shade400),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(

                width: 0.9.sw,
                height: 0.05.sh,
                child: TextField(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(18),
                      color: LightThemeColors.textColor),
                  decoration: InputDecoration(

                    prefixIcon:  Padding(
                        padding: EdgeInsets.all(10), // add padding to adjust icon
                        child: SvgPicture.asset('assets/icons/phone.svg')),
                    contentPadding: EdgeInsets.all(8),
                    hintText: "رقم الجوال",
                    hintStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(16.sp),
                        color: Colors.grey.shade400),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
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
                height: 15.h,
              ),
              Container(

                width: 0.9.sw,
                height: 0.05.sh,
                child: TextField(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(18),
                      color: LightThemeColors.textColor),
                  decoration: InputDecoration(
                    prefixIcon:  Padding(
                        padding: EdgeInsets.all(10), // add padding to adjust icon
                        child: SvgPicture.asset('assets/icons/unlock.svg')),
                    contentPadding: EdgeInsets.all(8),
                    hintText: "الرقم السري",
                    hintStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        color: Colors.grey.shade400),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(

                width: 0.9.sw,
                height: 0.05.sh,
                child: TextField(
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(18),
                      color: LightThemeColors.textColor),
                  decoration: InputDecoration(
                    prefixIcon:  Padding(
                        padding: EdgeInsets.all(8), // add padding to adjust icon
                        child: SvgPicture.asset('assets/icons/unlock.svg')),
                    contentPadding: EdgeInsets.all(8),
                    hintText: "اعادة الرقم السري",
                    hintStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        color: Colors.grey.shade400),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
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
                    "الموافقة عللى اتفاقية المتجر",
                    style: TextStyle(color: LightThemeColors.primaryColor,fontSize: 14.sp),
                  ),

                ],
              ),
              SizedBox(
                width: 0.7.sw,
                height: 56.h,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "تسجيل",
                      style: TextStyle(
                        fontSize: 21.sp,
                        color: Colors.white,
                        fontFamily: 'Noto',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: LightThemeColors.secondColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45)))),
              ),
            ],
          )),
    ));
  }
}
