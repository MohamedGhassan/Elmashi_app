// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubscriptionsState extends SubscriptionsState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final bool? isLoadingPac;
  @override
  final bool? isSuccessPac;
  @override
  final bool? isLoadingSub;
  @override
  final bool? isSuccessSub;
  @override
  final MyBankModel? myBankModel;
  @override
  final PackagesModel? packagesModel;
  @override
  final SubscriptionModel? subscriptionModel;
  @override
  final String? errorMessage;
  @override
  final bool? isLoadingBank;
  @override
  final bool? isSuccessBank;

  factory _$SubscriptionsState(
          [void Function(SubscriptionsStateBuilder)? updates]) =>
      (new SubscriptionsStateBuilder()..update(updates)).build();

  _$SubscriptionsState._(
      {this.isSuccess,
      this.isLoading,
      this.isLoadingPac,
      this.isSuccessPac,
      this.isLoadingSub,
      this.isSuccessSub,
      this.myBankModel,
      this.packagesModel,
      this.subscriptionModel,
      this.errorMessage,
      this.isLoadingBank,
      this.isSuccessBank})
      : super._();

  @override
  SubscriptionsState rebuild(
          void Function(SubscriptionsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionsStateBuilder toBuilder() =>
      new SubscriptionsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionsState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        isLoadingPac == other.isLoadingPac &&
        isSuccessPac == other.isSuccessPac &&
        isLoadingSub == other.isLoadingSub &&
        isSuccessSub == other.isSuccessSub &&
        myBankModel == other.myBankModel &&
        packagesModel == other.packagesModel &&
        subscriptionModel == other.subscriptionModel &&
        errorMessage == other.errorMessage &&
        isLoadingBank == other.isLoadingBank &&
        isSuccessBank == other.isSuccessBank;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, isSuccess.hashCode),
                                                isLoading.hashCode),
                                            isLoadingPac.hashCode),
                                        isSuccessPac.hashCode),
                                    isLoadingSub.hashCode),
                                isSuccessSub.hashCode),
                            myBankModel.hashCode),
                        packagesModel.hashCode),
                    subscriptionModel.hashCode),
                errorMessage.hashCode),
            isLoadingBank.hashCode),
        isSuccessBank.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubscriptionsState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isLoadingPac', isLoadingPac)
          ..add('isSuccessPac', isSuccessPac)
          ..add('isLoadingSub', isLoadingSub)
          ..add('isSuccessSub', isSuccessSub)
          ..add('myBankModel', myBankModel)
          ..add('packagesModel', packagesModel)
          ..add('subscriptionModel', subscriptionModel)
          ..add('errorMessage', errorMessage)
          ..add('isLoadingBank', isLoadingBank)
          ..add('isSuccessBank', isSuccessBank))
        .toString();
  }
}

class SubscriptionsStateBuilder
    implements Builder<SubscriptionsState, SubscriptionsStateBuilder> {
  _$SubscriptionsState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isLoadingPac;
  bool? get isLoadingPac => _$this._isLoadingPac;
  set isLoadingPac(bool? isLoadingPac) => _$this._isLoadingPac = isLoadingPac;

  bool? _isSuccessPac;
  bool? get isSuccessPac => _$this._isSuccessPac;
  set isSuccessPac(bool? isSuccessPac) => _$this._isSuccessPac = isSuccessPac;

  bool? _isLoadingSub;
  bool? get isLoadingSub => _$this._isLoadingSub;
  set isLoadingSub(bool? isLoadingSub) => _$this._isLoadingSub = isLoadingSub;

  bool? _isSuccessSub;
  bool? get isSuccessSub => _$this._isSuccessSub;
  set isSuccessSub(bool? isSuccessSub) => _$this._isSuccessSub = isSuccessSub;

  MyBankModel? _myBankModel;
  MyBankModel? get myBankModel => _$this._myBankModel;
  set myBankModel(MyBankModel? myBankModel) =>
      _$this._myBankModel = myBankModel;

  PackagesModel? _packagesModel;
  PackagesModel? get packagesModel => _$this._packagesModel;
  set packagesModel(PackagesModel? packagesModel) =>
      _$this._packagesModel = packagesModel;

  SubscriptionModel? _subscriptionModel;
  SubscriptionModel? get subscriptionModel => _$this._subscriptionModel;
  set subscriptionModel(SubscriptionModel? subscriptionModel) =>
      _$this._subscriptionModel = subscriptionModel;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  bool? _isLoadingBank;
  bool? get isLoadingBank => _$this._isLoadingBank;
  set isLoadingBank(bool? isLoadingBank) =>
      _$this._isLoadingBank = isLoadingBank;

  bool? _isSuccessBank;
  bool? get isSuccessBank => _$this._isSuccessBank;
  set isSuccessBank(bool? isSuccessBank) =>
      _$this._isSuccessBank = isSuccessBank;

  SubscriptionsStateBuilder();

  SubscriptionsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isLoadingPac = $v.isLoadingPac;
      _isSuccessPac = $v.isSuccessPac;
      _isLoadingSub = $v.isLoadingSub;
      _isSuccessSub = $v.isSuccessSub;
      _myBankModel = $v.myBankModel;
      _packagesModel = $v.packagesModel;
      _subscriptionModel = $v.subscriptionModel;
      _errorMessage = $v.errorMessage;
      _isLoadingBank = $v.isLoadingBank;
      _isSuccessBank = $v.isSuccessBank;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscriptionsState;
  }

  @override
  void update(void Function(SubscriptionsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubscriptionsState build() {
    final _$result = _$v ??
        new _$SubscriptionsState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            isLoadingPac: isLoadingPac,
            isSuccessPac: isSuccessPac,
            isLoadingSub: isLoadingSub,
            isSuccessSub: isSuccessSub,
            myBankModel: myBankModel,
            packagesModel: packagesModel,
            subscriptionModel: subscriptionModel,
            errorMessage: errorMessage,
            isLoadingBank: isLoadingBank,
            isSuccessBank: isSuccessBank);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
