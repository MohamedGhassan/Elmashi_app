

import 'package:built_value/built_value.dart';
import 'package:ealmashi/features/Screen/bank_transfer/model/mybank/mybank_model.dart';
import 'package:ealmashi/features/Screen/bank_transfer/model/packages_model.dart';
import 'package:ealmashi/features/Screen/bank_transfer/model/subscriptions/sub_model.dart';

part 'subscriptions_state.g.dart';


  abstract class SubscriptionsState implements Built<SubscriptionsState, SubscriptionsStateBuilder> {


  bool? get isSuccess;

  bool? get isLoading;


  bool? get isLoadingPac;

  bool? get isSuccessPac;

  bool? get isLoadingSub;

  bool? get isSuccessSub;

  MyBankModel? get myBankModel;

  PackagesModel? get packagesModel;

  SubscriptionModel? get subscriptionModel;

  String? get errorMessage;

  bool? get isLoadingBank;

  bool? get isSuccessBank;

  SubscriptionsState._();

  factory SubscriptionsState([void Function(SubscriptionsStateBuilder) updates]) = _$SubscriptionsState;

  factory SubscriptionsState.initial() {
    return SubscriptionsState((b) => b
      ..isLoading = false
      ..isSuccess = false
       ..isLoadingPac=false
        ..isSuccessPac=false
      ..isLoadingBank=false
      ..isSuccessBank=false
      ..isLoadingSub=false
      ..isSuccessSub=false
       ..packagesModel=PackagesModel(data: [])
      ..myBankModel=MyBankModel(data: [])
        ..subscriptionModel=SubscriptionModel(code: 0 , status: false)

    );
  }
}
