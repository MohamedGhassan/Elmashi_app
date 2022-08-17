

import 'package:built_value/built_value.dart';
import 'package:ealmashi/features/Screen/AboutUs/model/about_us_model.dart';
import 'package:ealmashi/features/Screen/AboutUs/model/data.dart';
import 'package:ealmashi/features/Screen/Policies/model/data.dart';
import 'package:ealmashi/features/Screen/Policies/model/policies_model.dart';
import 'package:ealmashi/features/Screen/contact_us/model/contactUs_response.dart';


part 'Policies_state.g.dart';


  abstract class PoliciesState implements Built<PoliciesState, PoliciesStateBuilder> {


  bool? get isSuccess;

  bool? get isLoading;

  String? get errorMessage;

  PoliciesModel? get policiesModel;

  PoliciesState._();

  factory PoliciesState([void Function(PoliciesStateBuilder) updates]) = _$PoliciesState;

  factory PoliciesState.initial() {
    return PoliciesState((b) => b
      ..isLoading = false
      ..isSuccess = false
       ..errorMessage = ''
        ..policiesModel=PoliciesModel(
        data: PoliciesData(name: '',id: 0,content: '',title: '')
            )



      );
  }
}
