import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:ealmashi/features/Screen/home/bloc/pages_state.dart';
import 'package:ealmashi/features/Screen/home/model/category_id_model.dart';
import 'package:ealmashi/features/Screen/home/widget/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:ui' as ui;
import 'bloc/PagesBloc.dart';
import 'home.dart';
import 'model/data_cateid.dart';

class ResultSearch extends StatefulWidget {
  VoidCallback voidCallback;
  VoidCallback goToChat;
  int cate_id;
  String name;
  PagesBloc bloc;

  ResultSearch(
      {required this.voidCallback,
      required this.goToChat,
      required this.cate_id,
      required this.bloc,
      required this.name});

  @override
  _ResultSearchState createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  int i=1;
  @override

  void initState() {
    widget.bloc.onGetCategoryEvent(widget.cate_id);
    super.initState();
  }
  late Position _position;
  late double _distanceInMeters=0;
  Future<double> _displayCurrentLocation(double? lat,double? long) async {


    try {
      final location = await Geolocator.getCurrentPosition();

      setState(() {
        _position = location;
      });
      _distanceInMeters = Geolocator.distanceBetween(
        _position.latitude,
        _position.longitude,
        lat!,
        long!,
      );
    } catch (e) {
      print('Error:- ${e.toString()}');
    }
    return  _distanceInMeters;
  }
  List<DataCateId> categoryIdList=[];
  Future<void> _displayLocation(CategoryIdModel   categoryIdModel) async {
    categoryIdList=[];
    print('_displayLocation');
    for (var ac in categoryIdModel.data!) {
      var x= await  _displayCurrentLocation(ac.latitude!, ac.longitude!)  ;
      print(x);
      if(x<=10000)
        categoryIdList.add(ac);

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocConsumer<PagesBloc, PagesState>(
            bloc: widget.bloc,
            listener: (context, state) {
              if(state.isSuccessCateId!&&i==1){

                categoryIdList=[];
                i++;
                _displayLocation(state.categoryIdModel!);
              }
            },
            builder: (context, state) {


              if(state.isLoadingCateId!)
                return SizedBox(
                  height: 0.9.sh,
                  child:
                    Center(
                      child: CircularProgressIndicator(),
                    ),

                );
              if(categoryIdList.length==0)
                return   SizedBox(
                height: 0.9.sh,
                child:
                Column(
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
                                      onTap: () {
                                        widget.voidCallback();
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
                      height: 0.35.sh,
                    ),
                    Center(
                      child: Text(
                        'لا تتوفر الخدمة في موقعك الحالي',
                        style: TextStyle(
                          color: LightThemeColors.lightRedColor,
                          fontSize: 18.sp,
                          fontFamily: 'Noto',
                        ),
                      ),
                    ),
                  ],
                )

              );
              return Column(
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
                                      categoryIdList=[];
                                      widget.voidCallback();
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SizedBox(
                      height: 47.h,
                      width: 1.sw,
                      child: Container(
                        decoration: BoxDecoration(
                          color: LightThemeColors.secondColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontFamily: 'Noto',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'يمكن التواصل مباشرة او الانتقال للموقع',
                        style: TextStyle(
                          color: LightThemeColors.lightRedColor,
                          fontSize: 11.sp,
                          fontFamily: 'Noto',
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ListView.builder(
                      itemCount: categoryIdList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index)  {
                         return ItemSearch(index: index, goToChat: widget.goToChat,name: categoryIdList[index].name,lat:categoryIdList[index].latitude ,long: categoryIdList[index].longitude,id: categoryIdList[index].id,bloc: widget.bloc,activityUserId: categoryIdList[index].user![0].id,);
                      }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
