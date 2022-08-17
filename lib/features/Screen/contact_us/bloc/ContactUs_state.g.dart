// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ContactUs_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ContactUsState extends ContactUsState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? errorMessage;
  @override
  final ContactResponseModel? contactResponseModel;

  factory _$ContactUsState([void Function(ContactUsStateBuilder)? updates]) =>
      (new ContactUsStateBuilder()..update(updates)).build();

  _$ContactUsState._(
      {this.isSuccess,
      this.isLoading,
      this.errorMessage,
      this.contactResponseModel})
      : super._();

  @override
  ContactUsState rebuild(void Function(ContactUsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactUsStateBuilder toBuilder() =>
      new ContactUsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactUsState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        errorMessage == other.errorMessage &&
        contactResponseModel == other.contactResponseModel;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
            errorMessage.hashCode),
        contactResponseModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContactUsState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('errorMessage', errorMessage)
          ..add('contactResponseModel', contactResponseModel))
        .toString();
  }
}

class ContactUsStateBuilder
    implements Builder<ContactUsState, ContactUsStateBuilder> {
  _$ContactUsState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  ContactResponseModel? _contactResponseModel;
  ContactResponseModel? get contactResponseModel =>
      _$this._contactResponseModel;
  set contactResponseModel(ContactResponseModel? contactResponseModel) =>
      _$this._contactResponseModel = contactResponseModel;

  ContactUsStateBuilder();

  ContactUsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _errorMessage = $v.errorMessage;
      _contactResponseModel = $v.contactResponseModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactUsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactUsState;
  }

  @override
  void update(void Function(ContactUsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactUsState build() {
    final _$result = _$v ??
        new _$ContactUsState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            errorMessage: errorMessage,
            contactResponseModel: contactResponseModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
