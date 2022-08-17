import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/notification/notification_model.dart';
import 'package:ealmashi/features/Screen/home/bloc/PagesBloc.dart';
import 'package:ealmashi/features/Screen/home/bloc/pages_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui'as ui;

import '../../../injection.dart';
class Notifications extends StatefulWidget {


  NotificationModel notificationModel;
   Notifications({Key? key,required this.notificationModel}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  PagesBloc bloc=sl<PagesBloc>();
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return

      BlocBuilder<PagesBloc,PagesState>(
          bloc: bloc,
          builder: (context,state){
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child:state.isLoadingSlider!?SizedBox(
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
                  )):Column(
                children: [
                  SizedBox(height: 25.h,),
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
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 0.6.sw,
                              height: 46.h,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 2, color: Colors.grey.shade400))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [Icon(Icons.arrow_back_ios,textDirection: ui.TextDirection.ltr,)],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.h,),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.notificationModel!.data!.allNotifications!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.symmetric(vertical: 6.0.h
                            ,horizontal: 2.w
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(


                              width: 0.9.sw,
                              decoration: BoxDecoration(
                                color: LightThemeColors.backgroundYellowColor,
                                borderRadius: BorderRadius.circular(10),

                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.notifications,color: LightThemeColors.secondColor,),
                                        Text(state.notificationModel!.data!.allNotifications![index].content!,
                                          style: TextStyle(
                                              fontSize: 14.sp,

                                              color: LightThemeColors.secondColor,
                                              fontFamily: "Noto",

                                              fontWeight: FontWeight.w500
                                          ),
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(DateFormat('d-MM-yyyy HH:mm:ss','en').format(state.notificationModel!.data!.allNotifications![index].created_at!)   .toString() ,

                                          style: TextStyle(
                                              fontSize: 10.sp,

                                              color: LightThemeColors.lightRedColor,
                                              fontFamily: "Noto",

                                              fontWeight: FontWeight.w500
                                          ),
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        IconButton(icon: Icon(Icons.delete,size: 20.w,color: LightThemeColors.lightRedColor,),onPressed: (){
                                          bloc.onDeleteNotificationEvent(state.notificationModel!.data!.allNotifications![index].id!);
                                          bloc.onGetNotificationEvent();
                                        }, ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },)


                ],
              ),
            ),
          ),
        );
      })
      ;
  }
}
