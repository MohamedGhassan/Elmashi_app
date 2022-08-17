import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ealmashi/Globals.dart';
import 'package:ealmashi/Preference.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/data.dart';
import 'package:ealmashi/features/Screen/loginScreen/api/log_in_remote.dart';
import 'package:ealmashi/features/Screen/loginScreen/api/password_remote.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/data.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/login_response.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/package_model.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/password_response.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';

import 'LoginEvent.dart';
import 'login_state.dart';


class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LogInRemoteDataSource logInRemoteDataSource;
  ForgotPasswordRemoteDataSource forgotPasswordRemoteDataSource;
  LoginBloc({required this.logInRemoteDataSource,required this.forgotPasswordRemoteDataSource}) : super(LoginState.initial());

  void onLogin(String email,String password) {
    add(LoginEvent(
      email: email,
      password: password
    ));
  }
  void onForgotPasswordEmail(String email) {
    add(ForgotPasswordEmail(email
    ));
  }


  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    if (event is LoginEvent) {
      yield state.rebuild((b) => b
        ..isLoading = true
        ..isSuccess = false
        ..errorMessage=''
        ..loginModel=LoginResponseModel(
            code: 0,
            statue: false,
            message: '',
            data: Data(
                subscribed_package_name: '',
              subscriptions: [],
               user: UserDetails(
                 name: '',
                 photo: '',
                 type: '',
                 email: '',

                 id: 0,
                 api_token: '',

               )
            )
        )
      );
      final result = await logInRemoteDataSource.logIn(
      password:  event.password,
        email:  event.email,
      );
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
            Preferences.saveUserToken(r.data!.user.api_token);
            Preferences.saveName(r.data!.user.name!);
            Preferences.saveId(r.data!.user.id);
            if(r.data!.user.type=='user')
            Preferences.saveIsUser(true);
            else
            Preferences.saveIsUser(false);

            if(r.data!.subscriptions!.length>0)
              {
                Preferences.saveSubEnd(r.data!.subscriptions![0].to!);
                Global.subEnd=r.data!.subscriptions![0].to!;

                  if(r.data!.subscribed_package_name!=null){
                    Preferences.saveSubName(r.data!.subscribed_package_name!);
                    Global.subName=r.data!.subscribed_package_name!;

                  }

              }
            Global.isUser=Preferences.getIsUser();
            Global.userToken=r.data!.user.api_token;
            Global.userName=r.data!.user.name!;
            Global.userID=r.data!.user.id;
            }

            yield state.rebuild((b) => b
            ..isLoading = false
            ..isSuccess = true
            ..errorMessage = ''
            ..loginModel=r
          );
      });

  }
    else if(event is ForgotPasswordEmail)
    {
    yield state.rebuild((b) => b
        ..isLoadingPass=true
        ..isSuccessPass=false
      ..errorMessage=''
        ..passwordResponseModel=PasswordResponseModel(code: 0, statue: false, message: '')
    );
    final result = await forgotPasswordRemoteDataSource.reset(
      email:  event.email,
    );
    print("result");
    print(result);
    print("result");
    yield* result.fold((l) async* {
      yield state.rebuild((b) => b
        ..isLoadingPass = false
        ..isSuccessPass = false
        ..errorMessage = l);
    }, (r) async* {

      print('sucesss');

      yield state.rebuild((b) => b
        ..isLoadingPass = false
        ..isSuccessPass = true
        ..errorMessage = ''
        ..passwordResponseModel=r
      );
    });

    }
  }
}
