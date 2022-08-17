import 'dart:io';

import 'package:ealmashi/features/Screen/AboutUs/aboutus.dart';
import 'package:ealmashi/features/Screen/Policies/policies.dart';
import 'package:ealmashi/features/Screen/home/bloc/PagesBloc.dart';
import 'package:ealmashi/features/Screen/home/bloc/pages_state.dart';
import 'package:ealmashi/features/Screen/login/mainlog/mainlogscreen.dart';
import 'package:ealmashi/features/Screen/notifications/notifications.dart';
import 'package:ealmashi/features/Screen/pages/pages.dart';
import 'package:ealmashi/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;
import '../../../Globals.dart';
import '../../../Preference.dart';
import '../contact_us/contanctUsScreen.dart';
import 'account_detalies.dart';

class MyAccount extends StatefulWidget {
  MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount>
    with AutomaticKeepAliveClientMixin {
  PagesBloc bloc = sl<PagesBloc>();

  @override
  void initState() {
    bloc.onGetSocialLinksEvent();
    bloc.onGetUserDetailsEvent();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Global.userToken!.length > 1
              ? BlocConsumer<PagesBloc, PagesState>(
                  bloc: bloc,
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
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
                                        Icon(
                                          Icons.arrow_back_ios,
                                          textDirection: ui.TextDirection.ltr,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 0.5.sh,
                            child: Stack(
                              children: [
                                Container(
                                  height: 0.3.sh,
                                  color: LightThemeColors.secondColor,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/Account.svg",
                                          height: 60.h,
                                          width: 60.w,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      Global.userName!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp,
                                          fontFamily: 'Nahdi',
                                          color:
                                              LightThemeColors.backgroundColor),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      height: 41.h,
                                      width: 219.w,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: LightThemeColors
                                                .lightYellowColor),
                                        borderRadius: BorderRadius.circular(19),
                                      ),
                                      child: Center(
                                        child: Text(
                                          Global.subEnd!.length > 0
                                              ? Global.subEnd! +
                                                  '  ' +
                                                  'ينتهي اشتراكك'
                                              : 'غير مشترك',
                                          textDirection: ui.TextDirection.ltr,
                                          style: TextStyle(
                                              fontFamily: 'Nahdi',
                                              fontSize: 14.sp,
                                              color: LightThemeColors
                                                  .backgroundColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5.w,
                                            color:
                                                LightThemeColors.secondColor),
                                        color: LightThemeColors.backgroundColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w, vertical: 13.h),
                                      height: 175.h,
                                      width: 300.w,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AccountDetails(
                                                                    userMyaccountModel:
                                                                        state
                                                                            .userMyaccountModel,
                                                                  )),
                                                        );
                                                      },
                                                      child: SvgPicture.asset(
                                                        'assets/icons/Refreshmydata.svg',
                                                        height: 30.h,
                                                        color: LightThemeColors
                                                            .secondColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      'تحديث بياناتي',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12.sp,
                                                          color:
                                                              LightThemeColors
                                                                  .secondColor),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 40.h,
                                                width: 1.w,
                                                color:
                                                    LightThemeColors.textColor,
                                              ),
                                              Global.isUser!
                                                  ? Expanded(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                Pages(pageNumber: 1)),
                                                                  );
                                                                },
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/icons/who.svg',
                                                                  height: 30.h,
                                                                  color: LightThemeColors
                                                                      .secondColor,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            'المحادثات',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12.sp,
                                                                color: LightThemeColors
                                                                    .secondColor),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : Expanded(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                Pages(pageNumber: 0)),
                                                                  );
                                                                },
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/icons/MyOrders.svg',
                                                                  height: 30.h,
                                                                  color: LightThemeColors
                                                                      .secondColor,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            'الاشتراكات',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12.sp,
                                                                color: LightThemeColors
                                                                    .secondColor),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                              Container(
                                                height: 40.h,
                                                width: 1.w,
                                                color:
                                                    LightThemeColors.textColor,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        bloc.onGetNotificationEvent();
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ContactUsScreen(),
                                                              // Notifications(
                                                              //   notificationModel:
                                                              //       state.notificationModel!,
                                                            ));
                                                      },
                                                      child: Stack(
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/telegram.svg',
                                                              height: 30.h,
                                                              color: LightThemeColors
                                                                  .secondColor,
                                                            ),
                                                            if (state
                                                                    .notificationModel!
                                                                    .data!
                                                                    .unseenNotifications!
                                                                    .length >
                                                                0)
                                                              Positioned(
                                                                left: 15.w,
                                                                bottom: 12.h,
                                                                child:
                                                                    Container(
                                                                  child: Text(
                                                                    state
                                                                        .notificationModel!
                                                                        .data!
                                                                        .unseenNotifications!
                                                                        .length
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: LightThemeColors
                                                                            .backgroundColor,
                                                                        fontSize:
                                                                            10.sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  width: 20.w,
                                                                  height: 20.w,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                ),
                                                              ),
                                                          ]),
                                                    ),
                                                    Text(
                                                      'اتصل بنا',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12.sp,
                                                          color:
                                                              LightThemeColors
                                                                  .secondColor),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 40.h,
                                            thickness: 1.h,
                                            color: LightThemeColors
                                                .darkBackgroundColor,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AboutUS()),
                                                    );
                                                  },
                                                  child: Column(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/who .svg',
                                                        height: 30.h,
                                                        color: LightThemeColors
                                                            .secondColor,
                                                      ),
                                                      Text(
                                                        'من نحن',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12.sp,
                                                            color:
                                                                LightThemeColors
                                                                    .secondColor),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40.h,
                                                width: 1.w,
                                                color:
                                                    LightThemeColors.textColor,
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Platform.isAndroid
                                                        ? Share.share(
                                                            'https://play.google.com/store/apps/details?id=com.draw.ealmashi')
                                                        : Share.share(
                                                            'https://apps.apple.com/us/app/%D8%B9%D8%A7%D9%84%D9%85%D8%A7%D8%B4%D9%8A/id1604058062');
                                                  },
                                                  child: Column(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/FontAwsome (project-diagram).svg',
                                                        height: 30.h,
                                                        color: LightThemeColors
                                                            .secondColor,
                                                      ),
                                                      Text(
                                                        'مشاركة التطبيق',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10.sp,
                                                            color:
                                                                LightThemeColors
                                                                    .secondColor),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 40.h,
                                                width: 1.w,
                                                color:
                                                    LightThemeColors.textColor,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Policies()),
                                                        );
                                                      },
                                                      child: SvgPicture.asset(
                                                        'assets/icons/FontAwsome (file-pdf).svg',
                                                        height: 30.h,
                                                        color: LightThemeColors
                                                            .secondColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      'السياسات',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12.sp,
                                                          color:
                                                              LightThemeColors
                                                                  .secondColor),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          /*
                      Container(
                        height: 0.045.sh,
                        width: 0.6.sw,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "حساباتنا على التواصل",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14.sp,color: LightThemeColors.primaryColor),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: LightThemeColors.primaryColor, width: 0.5.h)),
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () async{
                                launch(state.socialLinksModel!.data!.snapchat!.url!);
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/FontAwsome (snapchat).svg',
                                height: 50.h,
                                width: 50.w,
                              )),

                          SizedBox(width: 10.w,),
                          IconButton(
                              onPressed: () {

                                launch(state.socialLinksModel!.data!.instagram!.url!);
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/FontAwsome (instagram).svg',
                                height: 50.h,
                                width: 50.w,
                              )),

                          SizedBox(width: 10.w,),
                          IconButton(
                              onPressed: () {
                                launch(state.socialLinksModel!.data!.twitter!.url!);
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/FontAwsome (twitter).svg',
                                height: 50.h,
                                width: 50.w,
                              )),

                          SizedBox(width: 10.w,),
                          IconButton(
                            onPressed: () {
                              launch(state.socialLinksModel!.data!.whatsapp!.url!);
                            },
                            icon: SvgPicture.asset(
                              'assets/icons/FontAwsome (whatsapp-square).svg',
                              height: 50.h,
                              width: 50.w,
                            ),),

                        ],
                      ),

                       */
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Preferences.saveUserToken('');
                              Preferences.saveSubEnd('');
                              Preferences.saveId(0);
                              Preferences.saveName('');
                              Preferences.saveSubName('');
                              Global.userToken = '';
                              Global.subName = '';
                              Global.subEnd = '';
                              Global.userID = 0;
                              Global.userName = "";
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainLog()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color:
                                              LightThemeColors.lightRedColor)),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        "خروج",
                                        style: TextStyle(
                                            color:
                                                LightThemeColors.lightRedColor),
                                      ),
                                      SizedBox(
                                        width: 26.w,
                                      ),
                                      SvgPicture.asset(
                                        "assets/icons/back.svg",
                                        height: 13.h,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : SizedBox(
                  height: 0.9.sh,
                  width: 1.sw,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffEAA947),
                            ),
                            borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h, horizontal: 4.w),
                          child: SizedBox(
                            width: 0.5.sw,
                            child: Text(
                              'يجب  تسجيل  الدخول',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: LightThemeColors.primaryColor,
                                  fontFamily: "Nahdi",
                                  fontWeight: FontWeight.w900),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: LightThemeColors.darkBackgroundColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainLog()),
                          );
                        },
                        child: SizedBox(
                          width: 0.5.sw,
                          child: Text(
                            'العودة  لتسجيل  الدخول',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: LightThemeColors.backgroundColor,
                                fontFamily: "Nahdi",
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
