import 'dart:async';
import 'dart:io';
import 'package:ealmashi/Globals.dart';
import 'package:ealmashi/features/Screen/bank_transfer/bloc/subscriptionsBloc.dart';
import 'package:ealmashi/features/Screen/bank_transfer/bloc/subscriptions_state.dart';
import 'package:ealmashi/features/Screen/home/bloc/PagesBloc.dart';
import 'package:ealmashi/features/Screen/home/bloc/pages_state.dart';
import 'package:ealmashi/features/Screen/login/mainlog/mainlogscreen.dart';
import 'package:ealmashi/features/Screen/pages/pages.dart';
import 'package:ealmashi/features/Screen/succ_screen/succ_screen.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'dart:ui' as ui;

import '../../../injection.dart';

class Banks {
  int id;
  String name;
  int days;

  Banks(this.id, this.name, this.days);
}

class BankTransfer2 extends StatefulWidget {
  // PagesBloc bloc;
  BankTransfer2({
    // required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  State<BankTransfer2> createState() => _BankTransfer2State();
}

class _BankTransfer2State extends State<BankTransfer2> {
  DateTime formattedDate = (DateTime.now());
  DateTime formattedDate2 = (DateTime.now());
  bool done = false;

  SubscriptionsBloc bloc = sl<SubscriptionsBloc>();
  late Banks _selectedBank;
  late Banks _selectedActivity;

  List<Banks> _plans = [];
  List<Banks> activities = [];
  double lan = 0;
  double lng = 0;

  int i = 1;
  int j = 1;
  late List<DropdownMenuItem<Banks>> _dropdownMenuPlan;
  late List<DropdownMenuItem<Banks>> _dropdownMenuActivity;

  late Widget alert;

  List<DropdownMenuItem<Banks>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Banks>> items = [];

    for (Banks ban in companies) {
      items.add(
        DropdownMenuItem(
          value: ban,
          child: Text(
            ban.name,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16),
              color: LightThemeColors.secondColor,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Banks? selectedCompany) {
    setState(() {
      _selectedBank = selectedCompany!;
    });
  }

  onChangeDropdownItem2(Banks? selectedCompany) {
    setState(() {
      _selectedActivity = selectedCompany!;
    });
  }

  var picker = ImagePicker();
  File? transferImage;

  Future<void> getImage() async {
    final pickerFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickerFile != null) {
      transferImage = File(pickerFile.path);

      setState(() {});
    } else {
      print('No Image Selected');
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController nameAc = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController bankName = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  LatLng center = LatLng(21.437273, 40.512714);
  Map<MarkerId, Marker> markers = {};

  @override
  void initState() {
    MarkerId markerId = MarkerId('orgin');
    Marker marker = Marker(
        markerId: markerId,
        icon: BitmapDescriptor.defaultMarker,
        position: center);
    markers[markerId] = marker;
    lan = 21.437273;
    lng = 40.512714;
    bloc.onBankNameEvent();
    // widget.bloc.onGetCategoriesEvent();
    // widget.bloc.onGetCategoryEvent(0);
    // widget.bloc.onGetNotificationEvent();
    bloc.onGetPackages();
    activities.add(Banks(0, "أختر نوع النشاط", 0));
    _plans.add(Banks(0, "أختر الخطة المناسبة", 0));
    _dropdownMenuPlan = buildDropdownMenuItems(_plans);
    _selectedBank = _dropdownMenuPlan[0].value!;
    _dropdownMenuActivity = buildDropdownMenuItems(activities);
    _selectedActivity = _dropdownMenuActivity[0].value!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubscriptionsBloc, SubscriptionsState>(
      // bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoadingBank!)
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
        return Column(
          children: [
            SizedBox(
              height: 25.h,
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
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 28.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0.h, horizontal: 4.w),
                          child: Text(
                            'الاشتراكات',
                            style: TextStyle(
                                fontSize: 21.sp,
                                color: LightThemeColors.secondColor,
                                fontFamily: "Noto",
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    height: 47.h,
                    width: 1.sw,
                    decoration: BoxDecoration(
                        color: LightThemeColors.backgroundYellowColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: LightThemeColors.lightYellowColor)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: DropdownButton(
                        isExpanded: true,
                        value: _selectedBank,
                        dropdownColor: LightThemeColors.backgroundYellowColor,
                        underline: Container(),
                        iconEnabledColor: LightThemeColors.secondColor,
                        onChanged: onChangeDropdownItem,
                        items: _dropdownMenuPlan,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    height: 47.h,
                    width: 1.sw,
                    decoration: BoxDecoration(
                        color: LightThemeColors.backgroundYellowColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: LightThemeColors.lightYellowColor)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: DropdownButton(
                        isExpanded: true,
                        value: _selectedActivity,
                        dropdownColor: LightThemeColors.backgroundYellowColor,
                        underline: Container(),
                        iconEnabledColor: LightThemeColors.secondColor,
                        onChanged: onChangeDropdownItem2,
                        items: _dropdownMenuActivity,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 0.8.sw,
                      child: TextField(
                        controller: nameAc,
                        style: TextStyle(
                            fontSize: 15.sp,
                            height: 0.7.h,
                            color: Colors.black),
                        maxLines: 1,
                        decoration: new InputDecoration(
                          hintText: 'اسم النشاط',
                          hintStyle: TextStyle(
                              fontSize: 13.sp,
                              height: 0.7.h,
                              color: LightThemeColors.lightGreyShade400),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: LightThemeColors.primaryColor,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 0.75.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border:
                        Border.all(color: LightThemeColors.darkBackgroundColor),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'حدد عنوان النشاط',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: LightThemeColors.darkBackgroundColor,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 299.h,
                  width: ScreenUtil().screenWidth - 40,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    tiltGesturesEnabled: true,
                    compassEnabled: true,
                    myLocationButtonEnabled: true,
                    scrollGesturesEnabled: true,
                    zoomGesturesEnabled: true,
                    onCameraMove: (CameraPosition _position) {
                      MarkerId markerId = MarkerId('orgin');
                      Marker marker = Marker(
                          markerId: markerId,
                          icon: BitmapDescriptor.defaultMarker,
                          position: _position.target);
                      markers[markerId] = marker;
                      lan = _position.target.latitude;
                      lng = _position.target.longitude;
                      setState(() {});
                    },
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: Set<Marker>.of(markers.values),
                    gestureRecognizers: Set()
                      ..add(Factory<PanGestureRecognizer>(
                          () => PanGestureRecognizer()))
                      ..add(Factory<ScaleGestureRecognizer>(
                          () => ScaleGestureRecognizer()))
                      ..add(Factory<TapGestureRecognizer>(
                          () => TapGestureRecognizer()))
                      ..add(Factory<VerticalDragGestureRecognizer>(
                          () => VerticalDragGestureRecognizer())),
                    onTap: (latAndLon) {
                      MarkerId markerId = MarkerId('orgin');
                      Marker marker = Marker(
                          markerId: markerId,
                          icon: BitmapDescriptor.defaultMarker,
                          position: latAndLon);
                      markers[markerId] = marker;
                      lan = latAndLon.latitude;
                      lng = latAndLon.longitude;
                      setState(() {});
                    },
                    initialCameraPosition: CameraPosition(
                      target: center,
                      zoom: 15,
                    ),
                    zoomControlsEnabled: true,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 28.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0.h, horizontal: 4.w),
                          child: Text(
                            'يمكن التحويل مباشرة واضافة بيانات التحويل',
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: LightThemeColors.lightRedColor,
                                fontFamily: "Noto",
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                for (int i = 0; i < state.myBankModel!.data!.length; i++)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      state.myBankModel!.data![i].image != null
                          ? SizedBox(
                              height: 90.h,
                              width: 90.w,
                              child: Image.network(
                                "https://aaa.3lmashy.com/storage/app/" +
                                    state.myBankModel!.data![i].image!,
                                fit: BoxFit.fill,
                              ))
                          : Container(),
                      SizedBox(
                        width: 30.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.myBankModel!.data![i].name!,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: LightThemeColors.lightGreyShade400,
                                fontFamily: "Nahdi",
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            state.myBankModel!.data![i].owner_name!,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: LightThemeColors.lightGreyShade400,
                                fontFamily: "Nahdi",
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            state.myBankModel!.data![i].account_number!,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: LightThemeColors.lightGreyShade400,
                                fontFamily: "Nahdi",
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Iban:' + state.myBankModel!.data![i].iban_number!,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: LightThemeColors.lightGreyShade400,
                                fontFamily: "Nahdi",
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: Divider(
                    thickness: 1,
                    color: LightThemeColors.lightGreyShade400,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: 0.9.sw,
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 0.8.sw,
                              child: TextField(
                                controller: name,
                                onChanged: (va) {
                                  setState(() {});
                                },
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    height: 0.7.h,
                                    color: Colors.black),
                                maxLines: 1,
                                decoration: new InputDecoration(
                                  hintText: 'الاسم',
                                  hintStyle: TextStyle(
                                      fontSize: 13.sp,
                                      height: 0.7.h,
                                      color:
                                          LightThemeColors.lightGreyShade400),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: LightThemeColors.primaryColor,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 0.8.sw,
                              child: TextField(
                                controller: bankName,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    height: 0.7.h,
                                    color: Colors.black),
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: 'اسم البنك المحول منه',
                                  hintStyle: TextStyle(
                                      fontSize: 13.sp,
                                      height: 0.7.h,
                                      color:
                                          LightThemeColors.lightGreyShade400),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: LightThemeColors.primaryColor,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 0.8.sw,
                              child: TextField(
                                controller: number,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    height: 0.7.h,
                                    color: Colors.black),
                                maxLines: 1,
                                decoration: new InputDecoration(
                                  hintText: 'ادخل رقم الحساب',
                                  hintStyle: TextStyle(
                                      fontSize: 13.sp,
                                      height: 0.7.h,
                                      color:
                                          LightThemeColors.lightGreyShade400),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: LightThemeColors.primaryColor,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            transferImage != null
                                ? GestureDetector(
                                    onTap: () {
                                      getImage();
                                    },
                                    child: Container(
                                      width: 0.8.sw,
                                      height: 200.h,
                                      child: Image.file(
                                        transferImage!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    width: 0.8.sw,
                                    child: TextField(
                                      readOnly: true,
                                      onTap: () {
                                        getImage();
                                        setState(() {});
                                      },
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          height: 0.7.h,
                                          color: Colors.black),
                                      maxLines: 1,
                                      decoration: new InputDecoration(
                                        hintText: 'ارفاق الايصال',
                                        hintStyle: TextStyle(
                                            fontSize: 13.sp,
                                            height: 0.7.h,
                                            color: LightThemeColors
                                                .lightGreyShade400),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: LightThemeColors
                                                    .primaryColor,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 0.7.sw,
                  height: 0.066.sh,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: LightThemeColors.secondColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45))),
                    onPressed: _selectedBank.id > 0 &&
                            transferImage != null &&
                            name.text.length > 0 &&
                            nameAc.text.length > 0 &&
                            number.text.length > 0 &&
                            lng != 0 &&
                            lan != 0 &&
                            bankName.text.length > 0
                        ? () {
                            formattedDate2 = DateTime(
                                formattedDate.year,
                                formattedDate.month,
                                formattedDate.day + _selectedBank.days);

                            bloc.onsubscriptionsEvent(
                                user_id: Global.userID!,
                                package_id: _selectedBank.id,
                                from: formattedDate,
                                to: formattedDate2,
                                transaction_image: transferImage!,
                                name: nameAc.text,
                                categoryId: _selectedActivity.id,
                                lan: lan,
                                lng: lng,
                                account_name: name.text,
                                account_number: number.text,
                                bank_name: bankName.text);
                          }
                        : () {
                            if (transferImage != null) {
                              Fluttertoast.showToast(
                                  msg: "الرجاء تحديد صورة",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      LightThemeColors.lightGreyShade400,
                                  textColor: LightThemeColors.backgroundColor,
                                  fontSize: 15.0.sp);
                            } else if (name.text.length > 0) {
                              Fluttertoast.showToast(
                                  msg: "الرجاء تحديد الأسم",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      LightThemeColors.lightGreyShade400,
                                  textColor: LightThemeColors.backgroundColor,
                                  fontSize: 15.0.sp);
                            } else if (nameAc.text.length > 0) {
                              Fluttertoast.showToast(
                                  msg: "الرجاء تحديد أسم الحساب",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      LightThemeColors.lightGreyShade400,
                                  textColor: LightThemeColors.backgroundColor,
                                  fontSize: 15.0.sp);
                            } else if (number.text.length > 0) {
                              Fluttertoast.showToast(
                                  msg: "الرجاء تحديد رقم الحساب",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      LightThemeColors.lightGreyShade400,
                                  textColor: LightThemeColors.backgroundColor,
                                  fontSize: 15.0.sp);
                            }
                          },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 85.w, vertical: 8.h),
                      child: Text(
                        'ارسال',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: LightThemeColors.backgroundColor,
                            fontFamily: "Nahdi",
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
