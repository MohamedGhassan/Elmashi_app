import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ealmashi/Globals.dart';
import 'package:ealmashi/Preference.dart';
import 'package:ealmashi/features/Screen/register/api/register_remote.dart';
import 'package:ealmashi/features/Screen/register/bloc/RegisterEvent.dart';
import 'package:ealmashi/features/Screen/register/bloc/register_state.dart';
import 'package:ealmashi/features/Screen/register/model/data.dart';
import 'package:ealmashi/features/Screen/register/model/register_response.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterState> {
  RegisterRemoteDataSource registerRemoteDataSource;

  RegisterBloc({required this.registerRemoteDataSource})
      : super(RegisterState.initial());

  void onRegister(
      String email, String mobile,String password, String name, String passwordConfirmation,bool is_user) {
    add(RegisterEvent(
        email: email,
        mobile: mobile,
        password: password,
        password_confirmation: passwordConfirmation,
        name: name,
        is_user: is_user
    ));
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvents event) async* {
    if (event is RegisterEvent) {
      yield state.rebuild((b) => b
        ..isLoading = true
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
        ));
      final result = await registerRemoteDataSource.register(
          email:event.email, mobile: event.mobile,name: event.name, password: event.password, password_confirmation: event.password_confirmation,type_isUser: event.is_user);
      print("result");
      print(result);

      print("result");
      yield* result.fold((l) async* {
        yield state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = false
          ..errorMessage = l);
      }, (r) async* {
        print('sucesss');
        if(r.data!=null)
        {
          Preferences.saveId(r.data!.id!);
          Global.userID=r.data!.id;
        }
        yield state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = true
          ..errorMessage = ''
          ..registerModel = r);
      });
    }
  }
}
