// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginState extends LoginState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? errorMessage;
  @override
  final LoginResponseModel? loginModel;
  @override
  final PasswordResponseModel? passwordResponseModel;
  @override
  final bool? isSuccessPass;
  @override
  final bool? isLoadingPass;

  factory _$LoginState([void Function(LoginStateBuilder)? updates]) =>
      (new LoginStateBuilder()..update(updates)).build();

  _$LoginState._(
      {this.isSuccess,
      this.isLoading,
      this.errorMessage,
      this.loginModel,
      this.passwordResponseModel,
      this.isSuccessPass,
      this.isLoadingPass})
      : super._();

  @override
  LoginState rebuild(void Function(LoginStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginStateBuilder toBuilder() => new LoginStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        errorMessage == other.errorMessage &&
        loginModel == other.loginModel &&
        passwordResponseModel == other.passwordResponseModel &&
        isSuccessPass == other.isSuccessPass &&
        isLoadingPass == other.isLoadingPass;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
                        errorMessage.hashCode),
                    loginModel.hashCode),
                passwordResponseModel.hashCode),
            isSuccessPass.hashCode),
        isLoadingPass.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('errorMessage', errorMessage)
          ..add('loginModel', loginModel)
          ..add('passwordResponseModel', passwordResponseModel)
          ..add('isSuccessPass', isSuccessPass)
          ..add('isLoadingPass', isLoadingPass))
        .toString();
  }
}

class LoginStateBuilder implements Builder<LoginState, LoginStateBuilder> {
  _$LoginState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  LoginResponseModel? _loginModel;
  LoginResponseModel? get loginModel => _$this._loginModel;
  set loginModel(LoginResponseModel? loginModel) =>
      _$this._loginModel = loginModel;

  PasswordResponseModel? _passwordResponseModel;
  PasswordResponseModel? get passwordResponseModel =>
      _$this._passwordResponseModel;
  set passwordResponseModel(PasswordResponseModel? passwordResponseModel) =>
      _$this._passwordResponseModel = passwordResponseModel;

  bool? _isSuccessPass;
  bool? get isSuccessPass => _$this._isSuccessPass;
  set isSuccessPass(bool? isSuccessPass) =>
      _$this._isSuccessPass = isSuccessPass;

  bool? _isLoadingPass;
  bool? get isLoadingPass => _$this._isLoadingPass;
  set isLoadingPass(bool? isLoadingPass) =>
      _$this._isLoadingPass = isLoadingPass;

  LoginStateBuilder();

  LoginStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _errorMessage = $v.errorMessage;
      _loginModel = $v.loginModel;
      _passwordResponseModel = $v.passwordResponseModel;
      _isSuccessPass = $v.isSuccessPass;
      _isLoadingPass = $v.isLoadingPass;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginState;
  }

  @override
  void update(void Function(LoginStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginState build() {
    final _$result = _$v ??
        new _$LoginState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            errorMessage: errorMessage,
            loginModel: loginModel,
            passwordResponseModel: passwordResponseModel,
            isSuccessPass: isSuccessPass,
            isLoadingPass: isLoadingPass);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
