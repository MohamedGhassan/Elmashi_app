// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AboutUs_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AboutUsState extends AboutUsState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? errorMessage;
  @override
  final AboutUsModel? aboutUsModel;

  factory _$AboutUsState([void Function(AboutUsStateBuilder)? updates]) =>
      (new AboutUsStateBuilder()..update(updates)).build();

  _$AboutUsState._(
      {this.isSuccess, this.isLoading, this.errorMessage, this.aboutUsModel})
      : super._();

  @override
  AboutUsState rebuild(void Function(AboutUsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AboutUsStateBuilder toBuilder() => new AboutUsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AboutUsState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        errorMessage == other.errorMessage &&
        aboutUsModel == other.aboutUsModel;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
            errorMessage.hashCode),
        aboutUsModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AboutUsState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('errorMessage', errorMessage)
          ..add('aboutUsModel', aboutUsModel))
        .toString();
  }
}

class AboutUsStateBuilder
    implements Builder<AboutUsState, AboutUsStateBuilder> {
  _$AboutUsState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  AboutUsModel? _aboutUsModel;
  AboutUsModel? get aboutUsModel => _$this._aboutUsModel;
  set aboutUsModel(AboutUsModel? aboutUsModel) =>
      _$this._aboutUsModel = aboutUsModel;

  AboutUsStateBuilder();

  AboutUsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _errorMessage = $v.errorMessage;
      _aboutUsModel = $v.aboutUsModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AboutUsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AboutUsState;
  }

  @override
  void update(void Function(AboutUsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AboutUsState build() {
    final _$result = _$v ??
        new _$AboutUsState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            errorMessage: errorMessage,
            aboutUsModel: aboutUsModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
