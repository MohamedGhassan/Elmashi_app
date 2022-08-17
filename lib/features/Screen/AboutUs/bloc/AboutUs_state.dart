

import 'package:built_value/built_value.dart';
import 'package:ealmashi/features/Screen/AboutUs/model/about_us_model.dart';
import 'package:ealmashi/features/Screen/AboutUs/model/data.dart';
import 'package:ealmashi/features/Screen/contact_us/model/contactUs_response.dart';


part 'AboutUs_state.g.dart';


  abstract class AboutUsState implements Built<AboutUsState, AboutUsStateBuilder> {


  bool? get isSuccess;

  bool? get isLoading;

  String? get errorMessage;

  AboutUsModel? get aboutUsModel;

  AboutUsState._();

  factory AboutUsState([void Function(AboutUsStateBuilder) updates]) = _$AboutUsState;

  factory AboutUsState.initial() {
    return AboutUsState((b) => b
      ..isLoading = false
      ..isSuccess = false
       ..errorMessage = ''
        ..aboutUsModel=AboutUsModel(
        data: AboutUSData(name: '',id: 0,content: '',title: '')
            )



      );
  }
}
