
import 'package:ealmashi/features/Screen/succ_screen/reset_password_succ.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:ealmashi/features/Screen/pages/pages.dart';

import 'package:ealmashi/injection.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'bloc/LoginBloc.dart';
import 'bloc/login_state.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  LoginBloc bloc = sl<LoginBloc>();
  TextEditingController email = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.isSuccessPass!) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ResetSuccScreen(

              ),
            ),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: ModalProgressHUD(
          inAsyncCall: state.isLoadingPass!,
          color: LightThemeColors.backgroundColor,
          progressIndicator: CircularProgressIndicator(
            color: LightThemeColors.primaryColor,
          ),
          child: Scaffold(
            body: Container(
              height: 1.sh,
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 150.h,
                    ),
                    SizedBox(
                        height: 92.h,
                        width: 168.w,
                        child: Image.asset("assets/images/logo.png")),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "استعادة الباسورد",
                      style: TextStyle(
                          color: LightThemeColors.primaryColor,
                          fontSize: 17.sp,
                          fontFamily: "Noto",
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 0.065.sh,
                      child: TextField(
                        controller: email,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: LightThemeColors.textColor),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                              padding: EdgeInsets.all(10),
                              // add padding to adjust icon
                              child: SvgPicture.asset('assets/icons/mail.svg')),
                          contentPadding: EdgeInsets.all(8),
                          hintText: "البريد الالكتروني",
                          hintStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.grey.shade400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      width: 0.7.sw,
                      height: 0.066.sh,
                      child: ElevatedButton(
                          onPressed: () {
                            bloc.onForgotPasswordEmail(
                              email.text.trim(),
                            );
                          },
                          child: Text(
                            "دخول",
                            style: TextStyle(
                                fontFamily: 'Noto',
                                fontSize: 17.sp,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: LightThemeColors.secondColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45)))),
                    ),
                  ],
                ),
              )),
            ),
          ),
        ));
      },
    );
  }
}
