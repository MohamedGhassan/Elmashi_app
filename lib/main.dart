import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ealmashi/Preference.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'features/Screen/splash/splash_screen.dart';

import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  await Preferences.init();
  await Firebase.initializeApp();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  await FirebaseMessaging.instance.getToken();

  if (Platform.isIOS) {
    _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Location location = Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
  }

  var locale;
  locale = Locale('ar', 'AR');
  runApp(EasyLocalization(
      supportedLocales: [Locale('ar', 'AR')],
      path: 'assets/translations',
      saveLocale: true,
      fallbackLocale: locale,
      child: MyApp(locale)));
}

class MyApp extends StatefulWidget {
  var locale;

  MyApp(this.locale);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (_, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: widget.locale,
        debugShowCheckedModeBanner: false,
        title: 'Ealmashi',
        theme: ThemeData(
          fontFamily: 'Noto',
          primaryColor: Colors.white,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
