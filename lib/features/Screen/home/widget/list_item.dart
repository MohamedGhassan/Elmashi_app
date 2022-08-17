import 'dart:io';

import 'package:ealmashi/Globals.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:ealmashi/features/Screen/home/bloc/PagesBloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ealmashi/features/Screen/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui'as ui;

import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
class ItemSearch extends StatefulWidget {

  int? index;
  int? id;
  int? activityUserId;
  String? name;
  double? long;
  double? lat;
  VoidCallback ?goToChat;
  PagesBloc? bloc;
  ItemSearch({Key? key,this.index,this.goToChat,this.name,this.lat,this.long,this.id,this.bloc,this.activityUserId });

  @override
  _ItemSearchState createState() => _ItemSearchState();
}

class _ItemSearchState extends State<ItemSearch> {
 late Position _position;
 late double _distanceInMeters=0;

  _displayCurrentLocation() async {


    try {
      final location = await Geolocator.getCurrentPosition();

      setState(() {
        _position = location;
      });
       _distanceInMeters = Geolocator.distanceBetween(
         _position.latitude,
         _position.longitude,
         widget.lat!,
         widget.long!,
      );
       _distanceInMeters =_distanceInMeters/1000;
    } catch (e) {
      print('Error:- ${e.toString()}');
    }
  }

  @override
  void initState() {
    _displayCurrentLocation();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: widget.index! % 2 == 0
              ? LightThemeColors.backgroundYellowColor
              : Colors.white,
          border: widget.index! % 2 != 0
              ? Border.all(
                  color: LightThemeColors.lightYellowColor,
                )
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(children: [
            Expanded(

              child: Text(widget.name!,style: TextStyle(
                color: LightThemeColors.textColor,
                fontSize: 16.sp,
                fontFamily: 'Noto',
              ),),
            ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(_distanceInMeters.toStringAsFixed(2)+" km",
                    textDirection: ui.TextDirection.ltr,
                    style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontFamily: 'Noto',
                ),),),
                Expanded(child:InkWell(child: SvgPicture.asset('assets/icons/map-marker.svg',color: LightThemeColors.lightRedColor,),onTap:()async{
                  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${widget.lat},${widget.long}';
                  ///String googleUrl = 'comgooglemaps://?center=${widget.lat},${widget.long}';
                String appleUrl = 'https://maps.apple.com/?sll=${widget.lat},${widget.long}';
                if (Platform.isAndroid) {
                print('launching com googleUrl');
                await launch(googleUrl);
                }   if (Platform.isIOS) {
                print('launching apple url');
                await launch(appleUrl);
                } else {
                throw 'Could not launch url';
                }},) ),
                Expanded(child: InkWell(
                    onTap:  (){
                      if(Global.userID! != widget.activityUserId) {
                        widget.bloc!.onCreateChatEvent(Global.userID!, widget.id!);
                        if(Global.isUser!)
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Pages(pageNumber: 1)));
                        else
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Pages(pageNumber: 2)));
                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "لا يمكنك اجراء محادثة مع نشاطك",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: LightThemeColors
                                .lightGreyShade400,
                            textColor: LightThemeColors
                                .backgroundColor,
                            fontSize: 15.0.sp);

                      }

                    },
                    child: SvgPicture.asset('assets/icons/chat.svg')),),
              ],
            ))
          ]),
        ),
      ),
    );
  }
}
