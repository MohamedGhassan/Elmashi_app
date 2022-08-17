import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ealmashi/features/Screen/login/verify/verifyscreen.dart';
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
import 'forget_password.dart';
import 'dart:ui' as ui;
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc bloc=sl<LoginBloc>();
  TextEditingController email=TextEditingController(
    text: ''
  );
  TextEditingController password=TextEditingController(
      text: ''
  );

  bool _passwordVisible=true;
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
        if(state.loginModel!.message!=null)
          {
            if(state.loginModel!.message!.length>0)
            {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.ERROR,
                animType: AnimType.BOTTOMSLIDE,
                title: 'فشل تسجيل الدخول',
                desc: state.loginModel!.message,
                btnCancelText: 'حسنا',
                btnCancelOnPress: () {},
              )..show();
            }
          }

        else if(state.errorMessage!.length>0){
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'فشل تسجيل الدخول',
            desc: state.errorMessage,
            btnCancelText: 'حسنا',
            btnCancelOnPress: () {},
          )..show();
        }
        else if(state.loginModel!.data!=null)
        {
          if(state.loginModel!.data!.user.api_token.length>0)
          {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Pages(
                  pageNumber: 0,
                ),
              ),
                  (route) => false,
            );
          }
        }

      },
      builder: (context, state) {
        return SafeArea(
            child: ModalProgressHUD(
              inAsyncCall: state.isLoading!,
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
                             Container(
                                width: 0.8.sw,
                                height: 60.h,

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                    onTap: () {
                                            Navigator.pop(context);
                                                },
                          child: Icon(
                                      Icons.arrow_back_ios,
                                      textDirection: ui.TextDirection.ltr,
                                        color: Colors.grey,
                                    ) ,) ,

                                  ],
                                ),

                            ),
                            SizedBox(height: 90.h,),

                            SizedBox(
                                height: 92.h,
                                width: 168.w,
                                child: Image.asset("assets/images/logo.png")),
                            SizedBox(height: 20.h,),
                            Text(
                              "دخول الأعضاء",
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
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(14),
                                    color: LightThemeColors.textColor),
                                decoration: InputDecoration(
                                  prefixIcon:  Padding(
                                      padding: EdgeInsets.all(10), // add padding to adjust icon
                                      child: SvgPicture.asset('assets/icons/mail.svg')),
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "رقم الجوال",
                                  hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Colors.grey.shade400),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(

                              height: 0.065.sh,
                              child: TextField(
                                controller: password,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(14),
                                    color: LightThemeColors.textColor),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: LightThemeColors.lightGreyShade400,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  prefixIcon:  Padding(
                                      padding: EdgeInsets.all(10), // add padding to adjust icon
                                      child: SvgPicture.asset('assets/icons/unlock.svg')),
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "كلمة المرور",
                                  hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Colors.grey.shade400),
                                ),
                                obscureText: _passwordVisible,

                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            FlatButton(
                                onPressed: (){
                              Route route = MaterialPageRoute(builder: (context) => ForgetPassword());
                              Navigator.pushReplacement(context, route);
                            }, child: Text(" نسيت كلمة المرور",style: TextStyle(
                                color: LightThemeColors.primaryColor,fontSize: 12.sp
                            ),)),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                              width: 0.7.sw,
                              height: 0.066.sh,
                              child: ElevatedButton(
                                  onPressed: () {
                                    bloc.onLogin(email.text, password.text);
                                  },
                                  child: Text(
                                    "دخول",
                                    style: TextStyle(
                                        fontFamily: 'Noto',
                                        fontSize: 17.sp,
                                        color: Colors.white
                                    ),                                ),
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
