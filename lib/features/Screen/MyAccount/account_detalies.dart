import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:ealmashi/features/Screen/home/bloc/PagesBloc.dart';
import 'package:ealmashi/features/Screen/home/bloc/pages_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

import '../../../injection.dart';
import 'model/myAcount/user_myAcc.dart';

class AccountDetails extends StatefulWidget {
  UserMyaccountModel? userMyaccountModel;
   AccountDetails({Key? key, this.userMyaccountModel}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  PagesBloc bloc =sl<PagesBloc>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
 @override
  void initState() {
   bloc.onGetUserDetailsEvent();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PagesBloc, PagesState>(
          bloc: bloc,
          listener: (context, state) {
            if(state.isSuccessUser!){
              nameController.text=state.userMyaccountModel!.data!.user!.name!;
              emailController.text=state.userMyaccountModel!.data!.user!.email!;
              phoneController.text=state.userMyaccountModel!.data!.user!.phone!;
            }
          },
          builder: (context, state) {
            if(state.isLoadingUser!)
              return SizedBox(
                  height: 0.9.sh,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                        onTap: () {},
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
                        height: 0.6.sh,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ));
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      Navigator.pop(context);
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
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'البيانات الشخصية',
                        style: TextStyle(
                          color: LightThemeColors.textColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Noto',
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10),
                        horizontal: ScreenUtil().setWidth(10)),
                    child: Text(
                      'الأسم',
                      style: TextStyle(
                        color: LightThemeColors.textColor,
                        fontSize: 15.sp,
                        fontFamily: 'Noto',),
                    ),
                  ),
                  Center(
                    child: Container(
                        width: ScreenUtil().screenWidth * 0.95,
                        height: 50.h,
                        color: Colors.grey.shade50,
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: ui.TextDirection.rtl,
                          children: [
                            Expanded(
                              child: TextField(
                                textDirection: ui.TextDirection.rtl,
                                style: TextStyle(
                                  color: LightThemeColors.textColor,
                                  fontSize: 14.sp,
                                  fontFamily: 'Noto',
                                ),
                                controller: nameController,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: LightThemeColors.textColor, width: 2.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide( color: LightThemeColors.textColor, width: 2.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.person_rounded,
                                      size: ScreenUtil().setWidth(20),
                                      color: LightThemeColors.textColor,
                                      textDirection: ui.TextDirection.ltr,
                                    ),
                                    hintTextDirection: ui.TextDirection.rtl,
                                    hintText: 'الأسم'.toString(),
                                    hintStyle: TextStyle(
                                      color: LightThemeColors.textColor,
                                      fontSize: 12.sp,
                                      fontFamily: 'Noto',
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                    )),
                                onChanged: (text) {},
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10),
                        horizontal: ScreenUtil().setWidth(10)),
                    child: Text(
                      'البريد الالكتروني',
                      style: TextStyle(
                        color: LightThemeColors.textColor,
                        fontSize: 14.sp,
                        fontFamily: 'Noto',),
                    ),
                  ),
                  Center(
                    child: Container(
                        width: ScreenUtil().screenWidth * 0.95,
                        height: 50.h,
                        color: Colors.grey.shade50,
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: ui.TextDirection.rtl,
                          children: [

                            Expanded(
                              child: TextField(

                                textDirection: ui.TextDirection.rtl,
                                style: TextStyle(
                                  color: LightThemeColors.textColor,
                                  fontSize: 14.sp,
                                  fontFamily: 'Noto',
                                ),
                                controller: emailController,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: LightThemeColors.textColor, width: 2.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide( color: LightThemeColors.textColor, width: 2.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      size: ScreenUtil().setWidth(20),
                                      color: LightThemeColors.textColor,
                                      textDirection: ui.TextDirection.ltr,
                                    ),
                                    hintTextDirection: ui.TextDirection.rtl,
                                    hintText: 'email@examble.com'.toString(),
                                    hintStyle: TextStyle(
                                      color: LightThemeColors.textColor,
                                      fontSize: 12.sp,
                                      fontFamily: 'Noto',
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                    )),
                                onChanged: (text) {},
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(10),
                        horizontal: ScreenUtil().setWidth(10)),
                    child: Text(
                      'الرقم',
                      style: TextStyle(
                        color: LightThemeColors.textColor,
                        fontSize: 14.sp,
                        fontFamily: 'Noto',),
                    ),
                  ),
                  Center(
                    child: Container(
                        width: ScreenUtil().screenWidth * 0.95,
                        height: 50.h,
                        color: Colors.grey.shade50,
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: ui.TextDirection.rtl,
                          children: [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                textDirection: ui.TextDirection.rtl,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(14),
                                ),
                                controller: phoneController,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: LightThemeColors.textColor, width: 2.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide( color: LightThemeColors.textColor, width: 2.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      size: ScreenUtil().setWidth(20),
                                      color: LightThemeColors.textColor,
                                      textDirection: ui.TextDirection.ltr,
                                    ),
                                    hintTextDirection: ui.TextDirection.rtl,
                                    hintText: 'Number phone'.toString(),
                                    hintStyle: TextStyle(
                                      color: LightThemeColors.textColor,
                                      fontSize: 12.sp,
                                      fontFamily: 'Noto',
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                    )),
                                onChanged: (text) {},
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: ScreenUtil().screenHeight * 0.02,
                  )

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
