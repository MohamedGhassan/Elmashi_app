import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:ealmashi/features/Screen/AboutUs/bloc/AboutUsBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

import '../../../injection.dart';
import 'bloc/PoliciesBloc.dart';
import 'bloc/Policies_state.dart';


class Policies extends StatefulWidget {
  const Policies({Key? key}) : super(key: key);

  @override
  _PoliciesState createState() => _PoliciesState();
}

class _PoliciesState extends State<Policies> {
  PoliciesBloc bloc = sl<PoliciesBloc>();

  @override
  void initState() {
    bloc.onPoliciesEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoliciesBloc, PoliciesState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.isLoading!)
          return SafeArea(
            child: Scaffold(
              body: SizedBox(
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
                  )),
            ),
          );
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
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
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 28.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0.h, horizontal: 4.w),
                            child: Text(
                              state.policiesModel!.data!.title!,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: LightThemeColors.secondColor,
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
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 0.9.sw,
                          decoration: BoxDecoration(
                            color: LightThemeColors.backgroundYellowColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state.policiesModel!.data!.content!,
                              softWrap: true,
                              maxLines: 150,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: LightThemeColors.secondColor,
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
            ),
          ),
        );
      },
    );
  }
}
