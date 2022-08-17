import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends LoginEvents {
      String email;
      String password;
  LoginEvent({
    required this.password,required this.email
});
}

class LoginWithFacebook extends LoginEvents {}

class LoginWithGmail extends LoginEvents {}

class LoginWithTwitter extends LoginEvents {}

class ForgotPasswordEmail extends LoginEvents {
  final email;
  ForgotPasswordEmail(this.email);
}

class ChangePassword extends LoginEvents {
  final password;
  ChangePassword(this.password);
}

class ChangeLanguage extends LoginEvents {
  final lang;
  ChangeLanguage(this.lang);
}

class ResetError extends LoginEvents {}

class Enable extends LoginEvents {}

class Disable extends LoginEvents {}
