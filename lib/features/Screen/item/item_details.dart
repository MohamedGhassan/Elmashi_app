import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';


class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  List<bool> selected=[false,false,true];
  int count=1;

  String formattedDate = DateFormat('yyyy-MM-dd','en').format((DateTime.now()));

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 25.h,),
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 16.w
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: LightThemeColors.darkBackgroundColor,
                        size: 22.w,
                      ),
                    ),
                    Text(' غولدن كليفر',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: LightThemeColors.primaryColor,
                          fontFamily: "Nahdi",
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SvgPicture.asset('assets/icons/shopping-basket.svg',
                            color: LightThemeColors.darkBackgroundColor,
                          ),
                          Positioned(
                            left: 20.w,
                            bottom: 10.h,
                            child: Container(
                              child: Text('8',
                                style: TextStyle(
                                    color: LightThemeColors.backgroundColor,
                                    fontSize: 12.sp
                                ),
                                textAlign: TextAlign.center,
                              ),
                              width: 23.w,
                              height: 23.w,
                              decoration: BoxDecoration(
                                shape:BoxShape.circle,
                                color:
                                LightThemeColors.darkBackgroundColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(

                        image: DecorationImage(
                            image: AssetImage('assets/images/home_1.jpg',
                            ),
                            fit: BoxFit.fill
                        )
                    ),
                    width: ScreenUtil().screenWidth,
                    height: 180.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: GestureDetector(
                          onTap: (){
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xffEFBE75),
                                width: 2
                              )
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: Icon(Icons.share,
                                color: Color(0xffEFBE75),
                                size: 15.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.w),
                    child: Container(
                      width: ScreenUtil().screenWidth/2,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffEAA947
                            ),),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 5.0.h
                            ,horizontal: 4.w
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text('استيك بقري',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: LightThemeColors.primaryColor,
                                    fontFamily: "Nahdi",
                                    fontWeight: FontWeight.w900
                                ),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text('65'+" "+'ر.س',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Color(0xffFF0000),
                                  fontFamily: "Nahdi",
                                  fontWeight: FontWeight.w900
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: ScreenUtil().screenWidth*0.65,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffEDDDB5
                          ),),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 5.0.h
                          ,horizontal: 4.w
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text('يتعين عليك اختيار الخدمات المرفقة',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: LightThemeColors.primaryColor,
                                  fontFamily: "Nahdi",
                                  fontWeight: FontWeight.w900
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10.h,),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 4.5,

                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemCount: 3,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(

                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                          Checkbox(value: selected[index],
                              activeColor: LightThemeColors.primaryColor,
                              onChanged: (va){
                            selected[index]=va!;
                            setState(() {

                            });
                          }),
                          Expanded(
                            flex: 2,
                            child: Text('شلوطة الراس',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: LightThemeColors.darkBackgroundColor,
                                  fontFamily: "Nahdi",
                                  fontWeight: FontWeight.w900
                              ),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            child: Text('50'+' '+'ر.س',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color:Color(0xffdd0000),
                                  fontFamily: "Nahdi",
                                  fontWeight: FontWeight.w900
                              ),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),


                        ],
                      ),

                    );
                  }),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.w),
                    child: Container(

                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: LightThemeColors.primaryColor
                            )
                          ),
                        ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 5.0.h
                            ,horizontal: 4.w
                        ),
                        child: Text('التفاصيل',
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: LightThemeColors.primaryColor,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: ScreenUtil().screenWidth*0.8,
                    child:Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text('خروف نعيمي بلدي طازج يوميا يتم التوصيل مجانا لمدينةالجبيل البد والصناعية فقط',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: LightThemeColors.darkBackgroundColor,


                        ),
                        textAlign: TextAlign.start,

                      ),
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12.w),
                      child: Divider(
                        color: LightThemeColors.lightGreyShade400,
                        thickness: 2,

                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        count++;
                      });

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Color(0xffEDDDB5),
                              width: 2
                          )
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child:  SvgPicture.asset('assets/icons/plus_icon.svg',
                          color: LightThemeColors.darkBackgroundColor,

                          width: 10.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    width: ScreenUtil().screenWidth*0.20,
                    decoration: BoxDecoration(
                        color: Color(0xffEDDDB5
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 5.0.h
                          ,horizontal: 4.w
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(count.toString(),
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: LightThemeColors.darkBackgroundColor,
                                  fontFamily: "Nahdi",
                                  fontWeight: FontWeight.w900
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        if(count>1)
                        count--;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Color(0xffEDDDB5),
                              width: 2
                          )
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child:  SvgPicture.asset('assets/icons/minus.svg',
                          color: LightThemeColors.darkBackgroundColor,
                          width: 10.w,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10.h,),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: LightThemeColors.darkBackgroundColor,
                onPressed: (){
                },

                child:  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 65.w,
                  vertical: 8.h
                  ),
                  child: Text('اضف للسلة',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: LightThemeColors.backgroundColor,
                        fontFamily: "Nahdi",
                        fontWeight: FontWeight.w900
                    ),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.w),
                    child: Container(

                      decoration: BoxDecoration(
                          border: Border.all(
                            color: LightThemeColors.primaryColor,),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 5.0.h
                            ,horizontal: 12.w
                        ),
                        child: Text('التعليقات',
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: LightThemeColors.primaryColor,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10.h,),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: 5,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(
                            horizontal: 12.w
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset('assets/icons/user_comment.svg',
                                  ),
                                  Text('عبد الله الخالدي',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: LightThemeColors.darkBackgroundColor,
                                        fontFamily: "Nahdi",
                                        fontWeight: FontWeight.w900
                                    ),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),

                              Text(formattedDate,
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: LightThemeColors.primaryColor,
                                    fontFamily: "Nahdi",
                                    fontWeight: FontWeight.w900
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 12.w),
                              child: Container(
                                width: ScreenUtil().screenWidth*0.9,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffEAA947
                                      ),),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Padding(
                                  padding:  EdgeInsets.only(bottom: 37.h,right: 3.w,
                                  top: 4.h
                                  ),
                                  child: Text('  متجر رائع  جد  ',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: LightThemeColors.darkBackgroundColor,
                                        fontFamily: "Nahdi",
                                        fontWeight: FontWeight.w900
                                    ),
                                    textAlign: TextAlign.start,

                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    );
                  },
              ),


              SizedBox(height: 30.h,),

            ],
          ),
        ),
      ),
    );
  }
}
