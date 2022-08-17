import 'dart:async';

import 'package:ealmashi/Globals.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:ealmashi/features/Screen/home/bloc/PagesBloc.dart';
import 'package:ealmashi/features/Screen/home/bloc/pages_state.dart';
import 'package:ealmashi/features/Screen/home/chat.dart';
import 'package:ealmashi/features/Screen/home/model/category_id_model.dart';
import 'package:ealmashi/features/Screen/home/result_home.dart';
import 'package:ealmashi/features/Screen/loginScreen/bloc/LoginBloc.dart';
import 'package:ealmashi/features/Screen/loginScreen/bloc/login_state.dart';
import 'package:ealmashi/features/Screen/notifications/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../injection.dart';

class Company {
  int id;
  String name;

  Company(this.id, this.name);
}

class Home extends StatefulWidget {
  PagesBloc bloc;

  Home({Key? key, required this.bloc}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  int select = 0;
  late Company _selectedCompany;
  List<Company> _locations = [];
  int _currentIndex = 0;
  late PageController controller;
  static const LatLng center = const LatLng(21.437273, 40.512714);
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late Position _position;
  late double _distanceInMeters=0;

 Future<double> _displayCurrentLocation(double lat,double long) async {


   try {
      final location = await Geolocator.getCurrentPosition();

      setState(() {
        _position = location;
      });
      _distanceInMeters = Geolocator.distanceBetween(
        _position.latitude,
        _position.longitude,
         lat,
         long,
      );
    } catch (e) {
      print('Error:- ${e.toString()}');
    }
    return  _distanceInMeters;
  }

  Future<void> _displayLocation(CategoryIdModel   categoryIdModel) async {

   print('_displayLocation');
    for (var ac in categoryIdModel.data!) {
      var x= await  _displayCurrentLocation(ac.latitude!, ac.longitude!)  ;
      print(x);
      if(x<=10000)
        markers.add(
          Marker(
              markerId: MarkerId(ac.id.toString()),
              position: LatLng(ac.latitude!, ac.longitude!),
              infoWindow: InfoWindow(title: ac.name)),
        );
    }
  }
  List<Marker> markers = [];
  int i = 1;
  int j=1;
  late List<DropdownMenuItem<Company>> _dropdownMenuItems;

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = [];
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(
            company.name,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontFamily: 'Noto',
            ),
          ),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company? selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany!;
    });
  }

  @override
  void initState() {
    widget.bloc.onGetCategoriesEvent();
    widget.bloc.onGetCategoryEvent(0);
    widget.bloc.onGetNotificationEvent();
    controller = PageController(initialPage: 0);
    _locations.add(Company(0, "أختر النشاط"));
    _dropdownMenuItems = buildDropdownMenuItems(_locations);
    _selectedCompany = _dropdownMenuItems[0].value!;
    super.initState();
  }

  @override
  Widget build(context) {
    return BlocConsumer<PagesBloc, PagesState>  (
      bloc: widget.bloc,
      listener: (context, state)  {},
      builder: (context, state)   {
        if (state.categoryModel!.data!.length > 0 && i == 1) {
          for (var ca in state.categoryModel!.data!) {
            _locations.add(Company(ca.id!, ca.name!));
            i++;
          }
          _dropdownMenuItems = buildDropdownMenuItems(_locations);
        }
        if (state.allActivity!.data!.length > 0 && j==1)  {
          j++;
          markers = [];
          _displayLocation(state.allActivity!);
        }
        return PageView(
            onPageChanged: (val) {
              setState(() {
                _currentIndex = val;
              });
            },
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
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
                                      GestureDetector(
                                        onTap: () {
                                        widget.bloc.onGetNotificationEvent();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Notifications(
                                                        notificationModel: state
                                                            .notificationModel!,
                                                      )));
                                        },
                                        child: Stack(

                                            clipBehavior: Clip.none,
                                            children: [ SvgPicture.asset(
                                              'assets/icons/bell.svg'),
                                            if(state.notificationModel!.data!.unseenNotifications!.length>0)
                                                Positioned(
                                                  left: 12.w,
                                                  bottom: 10.h,
                                                  child: Container(
                                                    child: Text(state.notificationModel!.data!.unseenNotifications!.length.toString(),
                                                      style: TextStyle(
                                                          color: LightThemeColors.backgroundColor,
                                                          fontSize: 10.sp
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    width: 20.w,
                                                    height: 20.w,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
      ]
                                        ),
                                      )
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Container(
                            height: 51.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Spacer(
                                  flex: 1,
                                ),
                                Global.userName!.length > 0
                                    ? Expanded(
                                        flex: 3,
                                        child: Text(
                                          'مرحباً بك: ' + Global.userName!,
                                          style: TextStyle(
                                            color:
                                                LightThemeColors.redTextColor,
                                            fontSize: 14.sp,
                                            fontFamily: 'Noto',
                                          ),
                                        ),
                                      )
                                    : Spacer(
                                        flex: 3,
                                      ),
                                Expanded(
                                    flex: 2,
                                    child: SvgPicture.asset(
                                        'assets/icons/street-view.svg')),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'أبحث عن أقرب الخدمات',
                              style: TextStyle(
                                color: LightThemeColors.textColor,
                                fontSize: 15.sp,
                                fontFamily: 'Noto',
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Container(
                            height: 47.h,
                            width: 1.sw,
                            decoration: BoxDecoration(
                              color: LightThemeColors.secondColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: DropdownButton(
                                  isExpanded: true,
                                  value: _selectedCompany,
                                  dropdownColor: LightThemeColors.secondColor,
                                  underline: Container(),
                                  onChanged: onChangeDropdownItem,
                                  iconEnabledColor: Colors.white,
                                  items: _dropdownMenuItems),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: SizedBox(
                            height: 47.h,
                            width: 1.sw,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_selectedCompany.id != 0) {
                                    _currentIndex = 1;
                                    controller.jumpToPage(_currentIndex);
                                  }
                                },
                                child: Text(
                                  "بحث",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontFamily: 'Noto',
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: LightThemeColors.lightBrownColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)))),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 0.4.sh,
                            child: GoogleMap(
                              mapType: MapType.normal,
                              myLocationEnabled: true,
                              tiltGesturesEnabled: true,
                              compassEnabled: true,
                              myLocationButtonEnabled: true,
                              scrollGesturesEnabled: true,
                              zoomGesturesEnabled: true,
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                              markers: Set<Marker>.of(markers),
                              gestureRecognizers: Set()
                                ..add(Factory<PanGestureRecognizer>(
                                    () => PanGestureRecognizer()))
                                ..add(Factory<ScaleGestureRecognizer>(
                                    () => ScaleGestureRecognizer()))
                                ..add(Factory<TapGestureRecognizer>(
                                    () => TapGestureRecognizer()))
                                ..add(Factory<VerticalDragGestureRecognizer>(
                                    () => VerticalDragGestureRecognizer())),
                              initialCameraPosition: CameraPosition(
                                target: center,
                                zoom: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ResultSearch(
                name: _selectedCompany.name,
                bloc: widget.bloc,
                cate_id: _selectedCompany.id,
                voidCallback: () {
                  _currentIndex = 0;
                  controller.jumpToPage(_currentIndex);
                },
                goToChat: () {
                  _currentIndex = 2;
                  controller.jumpToPage(_currentIndex);
                },
              ),
              Chat(
                voidCallback: () {
                  _currentIndex = 0;
                  controller.jumpToPage(_currentIndex);
                },
              ),
            ]);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
