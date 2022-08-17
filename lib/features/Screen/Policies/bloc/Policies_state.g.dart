// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Policies_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PoliciesState extends PoliciesState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? errorMessage;
  @override
  final PoliciesModel? policiesModel;

  factory _$PoliciesState([void Function(PoliciesStateBuilder)? updates]) =>
      (new PoliciesStateBuilder()..update(updates)).build();

  _$PoliciesState._(
      {this.isSuccess, this.isLoading, this.errorMessage, this.policiesModel})
      : super._();

  @override
  PoliciesState rebuild(void Function(PoliciesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PoliciesStateBuilder toBuilder() => new PoliciesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PoliciesState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        errorMessage == other.errorMessage &&
        policiesModel == other.policiesModel;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode),
            errorMessage.hashCode),
        policiesModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PoliciesState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('errorMessage', errorMessage)
          ..add('policiesModel', policiesModel))
        .toString();
  }
}

class PoliciesStateBuilder
    implements Builder<PoliciesState, PoliciesStateBuilder> {
  _$PoliciesState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  PoliciesModel? _policiesModel;
  PoliciesModel? get policiesModel => _$this._policiesModel;
  set policiesModel(PoliciesModel? policiesModel) =>
      _$this._policiesModel = policiesModel;

  PoliciesStateBuilder();

  PoliciesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _errorMessage = $v.errorMessage;
      _policiesModel = $v.policiesModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PoliciesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PoliciesState;
  }

  @override
  void update(void Function(PoliciesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PoliciesState build() {
    final _$result = _$v ??
        new _$PoliciesState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            errorMessage: errorMessage,
            policiesModel: policiesModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
