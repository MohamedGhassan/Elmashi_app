import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ealmashi/features/Screen/loginScreen/loginScreen.dart';
import 'package:ealmashi/features/Screen/succ_screen/resgester_succ_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:ealmashi/features/Screen/register/bloc/RegisterBloc.dart';
import 'package:ealmashi/features/Screen/register/bloc/register_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'dart:ui' as ui;
import '../../../injection.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc bloc = sl<RegisterBloc>();
  TextEditingController name = TextEditingController(text: '');
  TextEditingController mobile = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');
  TextEditingController confirmPassword = TextEditingController(text: '');
  TextEditingController email = TextEditingController(text: '');
  bool isUser = true;
  int? _value=1;
  bool checkBoxValue = true;
  bool _passwordVisible = true;
  bool _passwordVisible2 = true;
  String checkPassword = '';
  bool chek_Password_Boolian = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.registerModel!.message != null) {

          if(state.registerModel!.message!.length>1)
          {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              title: 'فشل تسجيل الدخول',
              desc: state.registerModel!.message,
              btnCancelText: 'حسنا',
              btnCancelOnPress: () {},
            )..show();
          }
        } else if (state.errorMessage!.length > 0) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'فشل تسجيل الحساب',
            desc: state.errorMessage,
            btnCancelText: 'حسنا',
            btnCancelOnPress: () {},
          )..show();
        } else if (state.registerModel!.data != null) {
          if (state.registerModel!.data!.id!>0)
          {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => RegesterSuccScreen(),), (route) => false,);
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
              child: SingleChildScrollView(
                  child: Column(
                    children: [

                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 0.8.sw,
                          height: 60.h,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                textDirection: ui.TextDirection.ltr,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 92.h,
                          width: 168.w,
                          child: Image.asset("assets/images/logo.png")),



                      Text(
                        "تسجيل الاعضاء",
                        style: TextStyle(
                            color: LightThemeColors.primaryColor,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(

                        width: 0.9.sw,
                        height: 0.065.sh,
                        child: TextField(
                          controller: name,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: LightThemeColors.textColor),
                          decoration: InputDecoration(
                            prefixIcon:  Padding(
                                padding: EdgeInsets.all(10), // add padding to adjust icon
                                child: SvgPicture.asset('assets/icons/user.svg')),
                            contentPadding: EdgeInsets.all(8),
                            hintText: "الاسم",
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

                        width: 0.9.sw,
                        height: 0.065.sh,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: mobile,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: LightThemeColors.textColor),
                          decoration: InputDecoration(

                            prefixIcon:  Padding(
                                padding: EdgeInsets.all(10), // add padding to adjust icon
                                child: SvgPicture.asset('assets/icons/phone.svg')),
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

                        width: 0.9.sw,
                        height: 0.065.sh,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: LightThemeColors.textColor),
                          decoration: InputDecoration(
                            prefixIcon:  Padding(
                                padding: EdgeInsets.all(10), // add padding to adjust icon
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
                      Container(

                        width: 0.9.sw,
                        height: 0.065.sh,
                        child: TextField(
                          controller: password,
                          obscureText: _passwordVisible,
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
                            hintText: "الرقم السري",
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

                        width: 0.9.sw,
                        height: 0.065.sh,
                        child: TextField(
                          onChanged: (str) {
                            setState(() {
                              checkPassword = str;
                              checkPassword == password.text ?
                              chek_Password_Boolian = true : chek_Password_Boolian = false;
                            });
                          },
                          controller: confirmPassword,
                          obscureText: _passwordVisible2,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: LightThemeColors.textColor),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: LightThemeColors.lightGreyShade400,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible2 = !_passwordVisible2;
                                });
                              },
                            ),
                            prefixIcon:  Padding(
                                padding: EdgeInsets.all(8), // add padding to adjust icon
                                child: SvgPicture.asset('assets/icons/unlock.svg')),
                            contentPadding: EdgeInsets.all(8),
                            hintText: "اعادة الرقم السري",
                            hintStyle: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                color: Colors.grey.shade400),
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),


                      Column(children: [
                        Row(

                          children: [
                          Radio(
                            activeColor:  LightThemeColors.primaryColor,
                              value: 1, groupValue: _value, onChanged: (int? va){
                            isUser=true;

                            setState(() {
                              _value=va;
                            });
                            print(isUser);
                          }),
                            Text(
                              "عميل",
                              style: TextStyle(
                                  color: LightThemeColors.primaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),

                          ],),
                        Row(

                          children: [
                            Radio(
                                activeColor:  LightThemeColors.primaryColor,
                                value: 2, groupValue: _value, onChanged: (int? va){
                              isUser=false;

                              setState(() {
                                 _value=va;
                              });
                              print(isUser);
                            }),
                            Text(
                              "تاجر",
                              style: TextStyle(
                                  color: LightThemeColors.primaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),

                          ],)
                      ],),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: <Widget>[
                                Checkbox(
                                    value: checkBoxValue,
                                    activeColor: Colors.green,
                                    onChanged: (bool? newValue) async {
                                      setState(() {
                                        checkBoxValue = newValue!;
                                      });
                                      Text("Remember me");
                                    }),
                              ],
                            ),
                          ),
                          Text(
                            "الموافقة على اتفاقية المتجر",
                            style: TextStyle(
                                color: LightThemeColors.primaryColor,
                                fontSize: 14.sp),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 0.7.sw,
                        height: 56.h,
                        child: ElevatedButton(
                            onPressed: checkBoxValue
                                ? () {
                                    chek_Password_Boolian == true
                                        ? bloc.onRegister(
                                            email.text,
                                            mobile.text,
                                            password.text,
                                            name.text,
                                            confirmPassword.text,
                                             isUser)
                                        : Fluttertoast.showToast(
                                            msg: "كلمات السر غير متطابقة",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: LightThemeColors
                                                .lightGreyShade400,
                                            textColor: LightThemeColors
                                                .backgroundColor,
                                            fontSize: 15.0.sp);
                                  }
                                : null,
                            child: Text(
                              "تسجيل",
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.white,
                                  fontFamily: 'Noto',
                                ),),
                            style: ElevatedButton.styleFrom(
                                primary: LightThemeColors.secondColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45)))),
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  )),
            ),
          ),
        ));
      },
    );
  }
}
