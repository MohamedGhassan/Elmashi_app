import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealmashi/core/utils/light_theme_colors.dart';
import 'package:ealmashi/features/Screen/home/bloc/pages_state.dart';
import 'package:ealmashi/features/Screen/login/mainlog/mainlogscreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../Globals.dart';
import 'bloc/PagesBloc.dart';
import 'widget/files_page.dart';

class Chat extends StatefulWidget {
  Chat._();

  static Chat chat = Chat._();
  VoidCallback? voidCallback;
  dynamic? timestamp;
  String? activity_name;
  String? user_name;
  int? user_id;
  String? activity_phone;
  int? activity_id;
  int? conversation_id;
  PagesBloc? bloc;
  int? index;

  Chat(
      {Key? key,
        this.voidCallback,
        this.activity_name,
        this.activity_id,
        this.bloc,
        this.activity_phone,
        this.index,
        this.user_name,
        this.conversation_id,
        this.timestamp,
        this.user_id})
      : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    widget.bloc!.onGetConvEvent(widget.conversation_id!);
    // content.clear();
    super.initState();
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          // controller: scrollController,
          physics: BouncingScrollPhysics(),
          child: Global.userToken!.length > 2
              ? BlocConsumer<PagesBloc, PagesState>(
            bloc: widget.bloc,
            listener: (context, state) {},
            builder: (context, state) {
              if (state.isLoadingChat!)
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
                                              color:
                                              Colors.grey.shade400))),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.arrow_back_ios,
                                            textDirection:
                                            ui.TextDirection.ltr,
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
              return Stack(children: [
                SizedBox(
                  height: 0.85.sh,
                  child: ListView(
                    shrinkWrap: true,
                    controller: scrollController,
                    reverse: true,
                    children:
                    [
                      Column(
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
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              textDirection:
                                              ui.TextDirection.ltr,
                                            ))
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        widget.activity_name!,
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
                          if (widget.activity_phone != null)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.0.h, horizontal: 28.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.0.h, horizontal: 4.w),
                                      child: Text(
                                        widget.activity_phone!,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: LightThemeColors
                                                .secondColor,
                                            fontFamily: "Noto",
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                      'assets/icons/FontAwsome (phone-square-alt).svg'),
                                ],
                              ),
                            ),
                          for (int i = 0;
                          i < state.getChatModel!.data!.length;
                          i++)
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0.h, horizontal: 2.w),
                                  child: Row(
                                    mainAxisAlignment: state.getChatModel!
                                        .data![i].is_from_user ==
                                        1
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40.h,
                                        width: 0.9.sw,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          border: Border.all(
                                            color: state
                                                .getChatModel!
                                                .data![i]
                                                .is_from_user ==
                                                1
                                                ? LightThemeColors
                                                .secondColor
                                                : LightThemeColors
                                                .secondColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(2.0),
                                                    child: SvgPicture.asset(
                                                      'assets/icons/FontAwsome (comment-alt).svg',
                                                      color: state
                                                          .getChatModel!
                                                          .data![i]
                                                          .is_from_user ==
                                                          1
                                                          ? LightThemeColors
                                                          .secondColor
                                                          : LightThemeColors
                                                          .secondColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    state
                                                        .getChatModel!
                                                        .data![i]
                                                        .is_from_user ==
                                                        1
                                                        ? widget.user_name!
                                                        : widget
                                                        .activity_name!,
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: state
                                                            .getChatModel!
                                                            .data![
                                                        i]
                                                            .is_from_user ==
                                                            1
                                                            ? LightThemeColors
                                                            .secondColor
                                                            : LightThemeColors
                                                            .secondColor,
                                                        fontFamily: "Noto",
                                                        fontWeight:
                                                        FontWeight
                                                            .w500),
                                                    textAlign:
                                                    TextAlign.start,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: state
                                                    .getChatModel!
                                                    .data![i]
                                                    .is_from_user ==
                                                    1
                                                    ? MainAxisAlignment.end
                                                    : MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    state
                                                        .getChatModel!
                                                        .data![i]
                                                        .created_at!
                                                        .substring(0, 10),
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: state
                                                            .getChatModel!
                                                            .data![
                                                        i]
                                                            .is_from_user ==
                                                            1
                                                            ? LightThemeColors
                                                            .secondColor
                                                            : LightThemeColors
                                                            .secondColor,
                                                        fontFamily: "Noto",
                                                        fontWeight:
                                                        FontWeight
                                                            .w500),
                                                    textAlign:
                                                    TextAlign.start,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0.h, horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: state
                                              .getChatModel!
                                              .data![i]
                                              .is_from_user ==
                                              1
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: state
                                                  .getChatModel!
                                                  .data![i]
                                                  .is_from_user ==
                                                  1
                                                  ? MainAxisAlignment.end
                                                  : MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.getChatModel!
                                                      .data![i].content!,
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: state
                                                          .getChatModel!
                                                          .data![i]
                                                          .is_from_user ==
                                                          1
                                                          ? LightThemeColors
                                                          .secondColor
                                                          : LightThemeColors
                                                          .secondColor,
                                                      fontFamily: "Noto",
                                                      fontWeight:
                                                      FontWeight.w500),
                                                  textAlign:
                                                  TextAlign.start,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: state
                                                  .getChatModel!
                                                  .data![i]
                                                  .is_from_user ==
                                                  1
                                                  ? MainAxisAlignment.end
                                                  : MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.check),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.86.sh,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0.h, horizontal: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 45.h,
                              width: 0.9.sw,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: LightThemeColors.secondColor,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: TextField(
                                        controller: content,
                                        onChanged: (va) {
                                          setState(() {});
                                        },
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black),
                                        decoration: new InputDecoration(
                                          hintText: 'اكتب الرسالة هنا...',
                                          hintStyle: TextStyle(
                                              fontSize: 13.sp,
                                              height: 0.7.h,
                                              color: LightThemeColors
                                                  .lightGreyShade400),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () async {
                                        final result = await FilePicker
                                            .platform
                                            .pickFiles(
                                            allowMultiple: true,
                                            type: FileType.custom,
                                            allowedExtensions: [
                                              'pdf',
                                              'mp4',
                                              'Jpg',
                                              'png'
                                            ]);
                                        if (result == null) return;
                                        openFiles(result.files);
                                      },
                                      icon: Icon(
                                        Icons.attach_file,
                                        color:
                                        LightThemeColors.secondColor,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: ()
                                        {
                                        },
                                        icon: Icon(
                                          Icons.keyboard_voice_sharp,
                                          color: LightThemeColors
                                              .secondColor,
                                          size: 25,
                                        )),
                                    SizedBox(width: 5),
                                    InkWell(
                                      onTap: content.text.length > 0
                                          ? () {
                                        if (Global.userID ==
                                            widget.user_id)
                                          widget.bloc!
                                              .onSendMassegEvent(
                                              content.text,
                                              widget
                                                  .conversation_id!,
                                              1);
                                        else
                                          widget.bloc!
                                              .onSendMassegEvent(
                                              content.text,
                                              widget
                                                  .conversation_id!,
                                              0);

                                        widget.bloc!.onGetConvEvent(
                                            widget
                                                .conversation_id!);
                                        content.text = '';
                                      }
                                          : null,
                                      child: SizedBox(
                                        child: SvgPicture.asset(
                                          'assets/icons/FontAwsome (paper-plane).svg',
                                          color: LightThemeColors
                                              .secondColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]);
            },
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainLog()),
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
    );
  }

  void openFiles(List<PlatformFile> files) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => FilesPage(
        files: files,
        onOpenedFile: openFile,
      ),
    ),
  );

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

// uploadAudio(String file) async {
//   firebaseStorage.ref().child(
//       'profilepics/audio${DateTime.now().millisecondsSinceEpoch.toString()}}.jpg');
//
//   // StorageUploadTask task = Reference.putFile(File(recordFilePath));
//
//   Reference reference = firebaseStorage.ref(file);
//   await reference.putFile(File(file));
//   var audioURL = await reference.getDownloadURL();
//   // String strVal = audioURL.toString();
//   return audioURL;
//   // await sendAudioMsg(strVal);
//   // reference.onComplete.then((value) async {
//   //   print('##############done#########');
//   //   var audioURL = await value.ref.getDownloadURL();
//   //   String strVal = audioURL.toString();
//   //   await sendAudioMsg(strVal);
//   // }).catchError((e) {
//   //   print(e);
//   // });
// }
// addMessagesToFirestore(Map map) async {
//   firebaseFirestore
//       .collection('Chats')
//       .add({...map, 'userId': AuthHelper.authHelper.getUserId()});
// }

}

