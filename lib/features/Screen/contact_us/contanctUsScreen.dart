import 'package:ealmashi/features/Screen/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;

import '../../../injection.dart';
import 'bloc/ContactUsBloc.dart';
import 'bloc/ContactUs_state.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  ContactUsBloc bloc = sl<ContactUsBloc>();
   TextEditingController name=TextEditingController();
  TextEditingController mobile=TextEditingController();
  TextEditingController subject=TextEditingController();
  TextEditingController message=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUsBloc, ContactUsState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
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
                                      width: 2, color: Colors.grey.shade400))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon( Icons.arrow_back_ios,
                                  textDirection: ui.TextDirection.ltr,),
                                onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Pages(pageNumber: 0)));
                                },

                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "يسعدنا تلقي استفساراتكم واتصالاتكم",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: LightThemeColors.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Image.asset(
                            'assets/icons/FontAwsome (headset).png',
                            height: 40.h,
                            width: 40.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "admin@admin.com",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: "Noto",
                                color: LightThemeColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Divider(
                        height: 30.h,
                        thickness: 1.h,
                        color: LightThemeColors.hintText,
                      ),
                      SizedBox(
                          width: 400.w,
                          child: TextField(
                            controller: name,
                           onChanged:(value) {
                             setState(() {

                             });
                           },
                            style: TextStyle(height: 1.h),
                            decoration: InputDecoration(
                                hintText: "الاسم",
                                hintStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: LightThemeColors.hintText),
                                border: OutlineInputBorder()),
                          )),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                          width: 400.w,
                          child: TextField(
                            controller: mobile,
                            keyboardType: TextInputType.number,
                            onChanged:(value) {
                              setState(() {

                              });
                            },
                            style: TextStyle(height: 1.h),
                            decoration: InputDecoration(
                                hintText: "الجوال",
                                hintStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: LightThemeColors.hintText),
                                border: OutlineInputBorder()),
                          )),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                          width: 400.w,
                          child: TextField(
                            controller: subject,
                            onChanged:(value) {
                              setState(() {

                              });
                            },
                            style: TextStyle(height: 1.h),
                            decoration: InputDecoration(
                                hintText: "العنوان",
                                hintStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: LightThemeColors.hintText),
                                border: OutlineInputBorder()),
                          )),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                          width: 400.w,
                          child: TextField(
                            style: TextStyle(height: 1.h),
                            controller: message,
                            onChanged:(value) {
                              setState(() {});
                            },
                            maxLines: 5,
                            decoration: InputDecoration(
                                hintText: "المحتوى",
                                hintStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: LightThemeColors.hintText),
                                border: OutlineInputBorder()),
                          )),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: 0.7.sw,
                        height: 0.066.sh,
                        child: ElevatedButton(
                            onPressed:name.text.length>0&&mobile.text.length>0&&subject.text.length>0&&message.text.length>0 ?()  {

                            bloc.onContactUs(name.text, mobile.text, subject.text, message.text);
                            Fluttertoast.showToast(
                                msg: "تم الإرسال بنجاح شكراً لتواصلكم معنا",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: LightThemeColors
                                    .lightGreyShade400,
                                textColor: LightThemeColors
                                    .backgroundColor,
                                fontSize: 15.0.sp);
                            name.clear();
                            mobile.clear();
                            subject.clear();
                            message.clear();
                            }:null,
                            child: Text(
                              "ارسال",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: LightThemeColors.backgroundColor),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: LightThemeColors.secondColor,

                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45)))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
