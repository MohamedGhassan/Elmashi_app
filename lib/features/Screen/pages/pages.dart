import 'package:ealmashi/Globals.dart';
import 'package:ealmashi/core/utils/show_notification.dart';
import 'package:ealmashi/features/Screen/AboutUs/aboutus.dart';
import 'package:ealmashi/features/Screen/Chat/chat.dart';
import 'package:ealmashi/features/Screen/MyAccount/MyAccount.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/notification/notification_model.dart';
import 'package:ealmashi/features/Screen/bank_transfer/bank_transfer.dart';
import 'package:ealmashi/features/Screen/contact_us/contanctUsScreen.dart';
import 'package:ealmashi/features/Screen/home/bloc/PagesBloc.dart';
import 'package:ealmashi/injection.dart';
import 'package:ealmashi/features/Screen/pages/pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';

import 'package:ealmashi/features/Screen/home/home.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../MyAccount/model/notification/data.dart';
import '../notifications/notifications.dart';
import '../notifications/notifications_screen.dart';

class Pages extends StatefulWidget {
  int pageNumber;

  Pages({Key? key, required this.pageNumber}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> with SingleTickerProviderStateMixin {
  late int select;
  late PageController controller;
  PagesBloc bloc = sl<PagesBloc>();

  @override
  void initState() {
    void selectNotification(String? payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Pages(pageNumber: 1)),
          (rot) => false);
    }

    Future<void> showNotification(
      String title,
      String body,
      String payload,
    ) async {
      String selectedNotificationPayload;
      // ignore: close_sinks
      final BehaviorSubject<String>? selectNotificationSubject =
          BehaviorSubject<String>();
      final FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      final NotificationAppLaunchDetails? notificationAppLaunchDetails =
          await flutterLocalNotificationsPlugin!
              .getNotificationAppLaunchDetails();
      if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
        selectedNotificationPayload = payload;
      }

      // ignore: close_sinks
      final BehaviorSubject<ReceivedNotification>
          didReceiveLocalNotificationSubject =
          BehaviorSubject<ReceivedNotification>();

      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('ic_notification');

      /// Note: permissions aren't requested here just to demonstrate that can be
      /// done later
      final IOSInitializationSettings initializationSettingsIOS =
          IOSInitializationSettings(
              requestAlertPermission: false,
              requestBadgePermission: false,
              requestSoundPermission: false,
              onDidReceiveLocalNotification: (id, title, body, pay) async =>
                  didReceiveLocalNotificationSubject.add(
                    ReceivedNotification(
                      id: id,
                      title: title,
                      body: body,
                      payload: pay,
                    ),
                  ));

      final InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: selectNotification);

      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('your channel id', 'your channel name',
              importance: Importance.max,
              priority: Priority.high,
              ticker: 'ticker');
      const IOSNotificationDetails iOSPlatformChannelSpecifics =
          IOSNotificationDetails(threadIdentifier: 'thread_id');
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin
          .show(0, title, body, platformChannelSpecifics, payload: payload);
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("message.data");

      print(message.data['conversation_id']);
      print("message.data");

      showNotification(
        message.notification!.title!,
        message.notification!.body!,
        message.data['conversation_id'],
      );
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("onMessageOpenedApp: $message");

      if (message.data['conversation_id'] != null) {
        int _yourId = int.parse(message.data["conversation_id"]);
        print("_yourId: $_yourId");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Pages(pageNumber: 1)));
      }
    });
    select = widget.pageNumber;
    bloc.onGetUserDetailsEvent();
    controller = PageController(initialPage: select);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: Global.isUser!
            ? [
                Home(
                  bloc: bloc,
                ),
                ChatScreen(
                  bloc: bloc,
                ),
                NotificationsScreen(),
                // ContactUsScreen(),
                MyAccount(),
              ]
            : [
                /*
        Home(
        bloc: bloc,
      ),*/
                BankTransfer(
                  bloc: bloc,
                ),
                ChatScreen(
                  bloc: bloc,
                ),
                NotificationsScreen(),
                // ContactUsScreen(),
                MyAccount(),
              ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: select,
        showUnselectedLabels: true,
        onTap: (int index) {
          select = index;
          controller.jumpToPage(index);

          if (index == 3) bloc.onGetUserDetailsEvent();
          setState(() {});
        },
        backgroundColor: LightThemeColors.secondColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: LightThemeColors.lightYellowColor,
        unselectedItemColor: Colors.white,
        elevation: 2,
        unselectedLabelStyle:
            TextStyle(color: Colors.white, fontSize: 12.sp, fontFamily: 'Noto'),
        selectedLabelStyle: TextStyle(
            color: LightThemeColors.lightYellowColor,
            fontSize: 12.sp,
            fontFamily: 'Noto'),
        items: Global.isUser!
            ? [
                BottomNavigationBarItem(
                  icon: Container(
                    width: 20.w,
                    height: 20.w,
                    child: SvgPicture.asset('assets/icons/house-damage.svg',
                        color: select == 0
                            ? LightThemeColors.lightYellowColor
                            : Colors.white),
                  ),
                  label: "الرئيسية",
                ),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 20.w,
                      height: 20.w,
                      child: SvgPicture.asset(
                        'assets/icons/who.svg',
                        color: select == 1
                            ? LightThemeColors.lightYellowColor
                            : Colors.white,
                      ),
                    ),
                    label: "المحادثات"),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 20.w,
                      height: 20.w,
                      child: SvgPicture.asset(
                        'assets/icons/notifications.svg',
                        color: select == 2
                            ? LightThemeColors.lightYellowColor
                            : Colors.white,
                      ),
                    ),
                    label: "الاشعارات"),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 20.w,
                      height: 20.w,
                      child: SvgPicture.asset(
                        'assets/icons/myaccount.svg',
                        color: select == 3
                            ? LightThemeColors.lightYellowColor
                            : Colors.white,
                      ),
                    ),
                    label: "حسابي")
              ]
            : [
                /*
                BottomNavigationBarItem(
                  icon: Container(
                    width: 20.w,
                    height: 20.w,
                    child: SvgPicture.asset('assets/icons/house-damage.svg',
                        color: select == 0
                            ? LightThemeColors.lightYellowColor
                            : Colors.white),
                  ),
                  label: "الرئيسية",
                ),*/
                BottomNavigationBarItem(
                    icon: Container(
                      width: 20.w,
                      height: 20.w,
                      child: SvgPicture.asset(
                        'assets/icons/copy.svg',
                        color: select == 0
                            ? LightThemeColors.lightYellowColor
                            : Colors.white,
                      ),
                    ),
                    label: "الاشتركات"),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 20.w,
                      height: 20.w,
                      child: SvgPicture.asset(
                        'assets/icons/who.svg',
                        color: select == 1
                            ? LightThemeColors.lightYellowColor
                            : Colors.white,
                      ),
                    ),
                    label: "المحادثات"),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 20.w,
                      height: 20.w,
                      child: SvgPicture.asset(
                        'assets/icons/notifications.svg',
                        color: select == 2
                            ? LightThemeColors.lightYellowColor
                            : Colors.white,
                      ),
                    ),
                    label: "الاشعارات"),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 20.w,
                      height: 20.w,
                      child: SvgPicture.asset(
                        'assets/icons/myaccount.svg',
                        color: select == 3
                            ? LightThemeColors.lightYellowColor
                            : Colors.white,
                      ),
                    ),
                    label: "حسابي")
              ],
      ),
    );
  }
}
