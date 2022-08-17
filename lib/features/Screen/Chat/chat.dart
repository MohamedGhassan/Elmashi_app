import 'package:ealmashi/Globals.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:ealmashi/features/Screen/Chat/widget/MessageItemWidget.dart';
import 'package:ealmashi/features/Screen/home/bloc/PagesBloc.dart';
import 'package:ealmashi/features/Screen/home/bloc/pages_state.dart';
import 'package:ealmashi/features/Screen/login/mainlog/mainlogscreen.dart';
import 'package:ealmashi/features/Screen/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatScreen extends StatefulWidget {


  VoidCallback? voidCallback;
  dynamic? timestamp;
  String? activity_name;
  String? user_name;
  int? user_id;
  String? activity_phone;
  int? activity_id;
  int? conversation_id;
  PagesBloc bloc;
  int? index;

  ChatScreen(
      {Key? key,
        this.voidCallback,
        this.activity_name,
        this.activity_id,
        required this.bloc,
        this.activity_phone,
        this.index,
        this.user_name,
        this.conversation_id,
        this.timestamp,
        this.user_id})
      : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {


      if (Global.userToken!.length > 0)
      widget.bloc.onGetAllConEvent(Global.userID!);

    super.initState();
  }
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PagesBloc, PagesState>(
      bloc: widget.bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: RefreshIndicator(
              onRefresh: () async {
                widget.bloc.onGetAllConEvent(Global.userID!);
              },
              child: ModalProgressHUD(
                inAsyncCall: state.isLoadingAllCon!,
                child: SingleChildScrollView(
                  // reverse: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Global.userToken!.length > 0
                      ? Column(
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
                                                  width: 2,
                                                  color:
                                                      Colors.grey.shade400))),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.arrow_back_ios,
                                                textDirection:
                                                    ui.TextDirection.ltr,
                                              ),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Pages(
                                                                pageNumber:
                                                                    0)));
                                              },
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.allConversationsModel!.data!.length,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 7);
                                },
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  if (state.allConversationsModel!.data![index].activity != null)
                                    return MessageItemWidget(
                                      message: state
                                          .allConversationsModel!.data![index],
                                      bloc: widget.bloc,
                                      index: index,
                                    );

                                  return Container();
                                }),
                            SizedBox(
                              height: 200.h,
                            ),
                          ],
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
                                  // scrollController.animateTo(
                                  //     scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 300),
                                  //     curve: Curves.easeOut);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainLog()),
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
            ),
          ),
        );
      },
    );
  }
}
