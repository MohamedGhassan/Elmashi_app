import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegisterEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterEvent extends RegisterEvents {
  String name;
  String mobile;
  String email;
  String password_confirmation;
  String password;
  bool is_user;

  RegisterEvent(
      {required this.name,
        required this.mobile,
      // ignore: non_constant_identifier_names
      required this.password,
      required this.password_confirmation,
      required this.is_user,
      required this.email});
}

class ChangeEmail extends RegisterEvents {
  final email;

  ChangeEmail(this.email);
}
class Changemobile extends RegisterEvents {
  final mobile;

  Changemobile(this.mobile);
}

class ChangePassword extends RegisterEvents {
  final password;

  ChangePassword(this.password);
}

class ChangeName extends RegisterEvents {
  final name;

  ChangeName(this.name);
}

class ChangePasswordConfirmation extends RegisterEvents {
  // ignore: non_constant_identifier_names
  final PasswordConfirmation;

  ChangePasswordConfirmation(this.PasswordConfirmation);
}
