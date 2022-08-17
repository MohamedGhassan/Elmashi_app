import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? preferences;
  static const String KEY_IS_First_Time = 'key_is_first_time';


  static const String KEY_UserToken = 'key_UserToken';
  static const String KEY_Name = 'key_Name';
  static const String KEY_Id = 'key_Id';
  static const String Sub_name = 'sub_name';
  static const String Sub_status = 'sub_status';
  static const String Sub_End= 'sub_end';
  static const String Is_User= 'is_user';

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveIsFirstTime(bool isFirstTime) async {
    String isFirstTimeString = jsonEncode(isFirstTime.toString());
    preferences!.setString(KEY_IS_First_Time, isFirstTimeString);
  }

  static void saveIsUser(bool isUser) async {

    preferences!.setBool(Is_User, isUser);
  }

  static bool getIsUser() {
    bool? isUser = preferences!.getBool(Is_User);

    if (null == isUser) {
      return true;
    }

    return isUser;
  }
  static bool getIsFirstTime() {
    String? isFirstTimeString = preferences!.getString(KEY_IS_First_Time);

    if (null == isFirstTimeString) {
      return true;
    }
    isFirstTimeString = jsonDecode(isFirstTimeString);
    if (isFirstTimeString == 'false') {
      return false;
    }
    return true;
  }



  static void saveName(String name) async {
    String nameEncoded = jsonEncode(name);
    preferences!.setString(KEY_Name, nameEncoded);
  }



  static String getName() {
    String? name = preferences!.getString(KEY_Name);

    if (null == name) {
      return '';
    }
    String nameDecoded = jsonDecode(name);
    return nameDecoded;
  }

  static void saveSubName(String name) async {

    preferences!.setString(Sub_name, name);
  }



  static String getSubName() {
    String? name = preferences!.getString(Sub_name);

    if (null == name) {
      return '';
    }

    return name;
  }

  static void saveSubStatus(String status) async {

    preferences!.setString(Sub_status, status);
  }



  static String getSubStatus() {
    String? name = preferences!.getString(Sub_status);

    if (null == name) {
      return '';
    }

    return name;
  }

  static void saveSubEnd(String name) async {

    preferences!.setString(Sub_End, name);
  }



  static String getSubEnd() {
    String? name = preferences!.getString(Sub_End);

    if (null == name) {
      return '';
    }

    return name;
  }

  static void saveId(int id) async {

    preferences!.setInt(KEY_Id, id);
  }



  static int getId() {
    int? id = preferences!.getInt(KEY_Id);

    if (null == id) {
      return -1;
    }

    return id;
  }





  static void saveUserToken(String userToken) async {
    preferences!.setString(KEY_UserToken, userToken);
  }

  static String? getUserToken() {
    String? userToken = preferences!.getString(KEY_UserToken);
     if(userToken==null)
       {
         return '';
       }
     else
    return userToken;
  }




}
