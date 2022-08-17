// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';
//
// class FirebaseStorageHelper {
//   FirebaseStorageHelper._();
//   static FirebaseStorageHelper firebaseStorageHelper =
//   FirebaseStorageHelper._();
//   FirebaseStorage firebaseStorage = FirebaseStorage.instance;
//
//   uploadImage(File file, [String folderName = 'profiles']) async {
//     //1- make a reference for this file in firebase storage
//     String filePath = file.path;
//     String fileName = filePath.split('/').last;
//     String path = 'images/$folderName/$fileName';
//     Reference reference = firebaseStorage.ref(path);
//     //2- upload the file to the defined refernce
//     await reference.putFile(file);
//     //3- get the file url
//     String imageUrl = await reference.getDownloadURL();
//     return imageUrl;
//   }
//
//   uploadAudio(String file) async {
//     firebaseStorage.ref().child(
//         'profilepics/audio${DateTime.now().millisecondsSinceEpoch.toString()}}.jpg');
//
//     // StorageUploadTask task = Reference.putFile(File(recordFilePath));
//
//     Reference reference = firebaseStorage.ref(file);
//     await reference.putFile(File(file));
//     var audioURL = await reference.getDownloadURL();
//     // String strVal = audioURL.toString();
//     return audioURL;
//     // await sendAudioMsg(strVal);
//     // reference.onComplete.then((value) async {
//     //   print('##############done#########');
//     //   var audioURL = await value.ref.getDownloadURL();
//     //   String strVal = audioURL.toString();
//     //   await sendAudioMsg(strVal);
//     // }).catchError((e) {
//     //   print(e);
//     // });
//   }
// }