// import 'dart:io';
//
// import 'package:ealmashi/core/provider/provider_helper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class AuthProvider extends ChangeNotifier {
//   int i = 0;
//   dynamic recordFilePath;
//   bool isPlayingMsg = false, isSending = false, isRecording = false;
//
//   // sendAudioMsg(String recordFilePath) async {
//   //   String audioMsg = await FirebaseStorageHelper.firebaseStorageHelper
//   //       .uploadAudio(recordFilePath);
//   //   FirestoreHelper.firestoreHelper.addMessagesToFirestore({
//   //     'type': 'audio',
//   //     'dateTime': DateTime.now(),
//   //     'content': audioMsg ?? '',
//   //   });
//   // }
//
//   Future<bool> checkPermission() async {
//     if (!await Permission.microphone.isGranted) {
//       PermissionStatus status = await Permission.microphone.request();
//       if (status != PermissionStatus.granted) {
//         return false;
//       }
//     }
//
//     return true;
//   }
//
//   Future<String> getFilePath() async {
//     Directory storageDirectory = await getApplicationDocumentsDirectory();
//     String sdPath = storageDirectory.path + "/record";
//     var d = Directory(sdPath);
//     if (!d.existsSync()) {
//       d.createSync(recursive: true);
//     }
//     return sdPath + "/test_${i++}.mp3";
//   }
// }
