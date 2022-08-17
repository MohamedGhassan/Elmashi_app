

import 'package:built_value/built_value.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/data.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/data.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/login_response.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/package_model.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/password_response.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';


part 'login_state.g.dart';


  abstract class LoginState implements Built<LoginState, LoginStateBuilder> {


  bool? get isSuccess;

  bool? get isLoading;

  String? get errorMessage;
  LoginResponseModel? get loginModel;

  PasswordResponseModel? get passwordResponseModel;

  bool? get isSuccessPass;

  bool? get isLoadingPass;

  LoginState._();

  factory LoginState([void Function(LoginStateBuilder) updates]) = _$LoginState;

  factory LoginState.initial() {
    return LoginState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingPass = false
      ..isSuccessPass = false
      ..errorMessage = ''
        ..loginModel=LoginResponseModel(
          code: 0,
            statue: false,
          message: '',
          data: Data(
              subscribed_package_name: '',
              subscriptions: [],
            user: UserDetails(
                api_token: '',
                type: '',
                email: '',
                photo: '',
                name: '',
                id: 0,
            )
          )
        )
     ..passwordResponseModel=PasswordResponseModel(code: 0, statue: false, message: '')


      );
  }
}
