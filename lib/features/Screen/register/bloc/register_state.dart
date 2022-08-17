

import 'package:built_value/built_value.dart';
import 'package:ealmashi/features/Screen/register/model/data.dart';

import 'package:ealmashi/features/Screen/register/model/register_response.dart';


part 'register_state.g.dart';


abstract class RegisterState implements Built<RegisterState, RegisterStateBuilder> {


  bool? get isSuccess;

  bool? get isLoading;

  String? get errorMessage;
  RegisterResponseModel? get registerModel;


  RegisterState._();

  factory RegisterState([void Function(RegisterStateBuilder) updates]) = _$RegisterState;

  factory RegisterState.initial() {
    return RegisterState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..errorMessage = ''
      ..registerModel=RegisterResponseModel(
          code: 0,
          statue: false,
          message: null,
          data: Data(
              email: '',
             name: '',
            phone: '',
            id: 0
          )
      )



    );
  }
}
