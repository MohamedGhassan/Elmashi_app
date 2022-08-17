import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ealmashi/features/Screen/bank_transfer/api/getPackages.dart';
import 'package:ealmashi/features/Screen/bank_transfer/api/mybank_remote.dart';
import 'package:ealmashi/features/Screen/bank_transfer/api/subscriptions_remote.dart';
import 'package:ealmashi/features/Screen/bank_transfer/bloc/subscriptionsEvent.dart';
import 'package:ealmashi/features/Screen/bank_transfer/bloc/subscriptions_state.dart';
import 'package:ealmashi/features/Screen/bank_transfer/model/mybank/mybank_model.dart';
import 'package:ealmashi/features/Screen/bank_transfer/model/packages_model.dart';
import 'dart:io';

import 'package:ealmashi/features/Screen/bank_transfer/model/subscriptions/sub_model.dart';



class SubscriptionsBloc extends Bloc<SubscriptionsEvents, SubscriptionsState> {
  PackagesRemoteDataSource packagesRemoteDataSource;
  MyBankRemoteDataSource myBankRemoteDataSource;
  SubscriptionRemoteDataSource subscriptionRemoteDataSource;
  SubscriptionsBloc({required this.packagesRemoteDataSource,required this.myBankRemoteDataSource,required this.subscriptionRemoteDataSource}) : super(SubscriptionsState.initial());



  void onGetPackages() {
    add(GetPackages(
    ));
  }

  void onBankNameEvent() {
    add(BankNameEvent(
    ));
  }
  void onsubscriptionsEvent({
    required int user_id,
    required int package_id,
    required  DateTime from,
    required DateTime to,
    required File transaction_image,
  required double lan,
    required double lng,
    required String name,
    required int categoryId,
    required   String account_name,
    required  String account_number,
    required String bank_name,
}

      ) {
    add(subscriptionsEvent(
        user_id: user_id,
        package_id: package_id,
        from: from,to: to,
        transaction_image: transaction_image,
      lng: lng,
      lan: lan,
      categoryId: categoryId,
      name: name,
      account_name: account_name,
      account_number: account_number,
      bank_name: bank_name
    ));
  }

  @override
  Stream<SubscriptionsState> mapEventToState(SubscriptionsEvents event) async* {
    if (event is GetPackages )
    {
      yield state.rebuild((b) => b
        ..isLoadingPac = true
        ..isSuccessPac  = false
        ..errorMessage=''
        ..packagesModel=PackagesModel(data: [])

      );
      final result = await packagesRemoteDataSource.getPackages();
      print("result");
      print(result);
      print("result");
      yield* result.fold(
              (l) async* {
            yield state.rebuild((b) => b
              ..isLoadingPac = false
              ..isSuccessPac  = false
              ..errorMessage = l);
          }, (r) async* {

        print('sucesss');
        print(r.data!.length);
        print('sucesss');

        yield state.rebuild((b) => b
          ..isLoadingPac  = false
          ..isSuccessPac  = true
          ..errorMessage = ''
          ..packagesModel=r
        );
      });
    }
    else if (event is BankNameEvent) {
      yield state.rebuild((b) =>
      b
        ..isLoadingBank = true
        ..isSuccessBank = false
        ..errorMessage = ''
        ..myBankModel = MyBankModel(data: [])
      );

      final result = await myBankRemoteDataSource.getMyBank(
      );
      print("result");
      print(result);
      print("result");
      yield* result.fold((l) async* {
        yield state.rebuild((b) =>
        b
          ..isLoadingBank = false
          ..isSuccessBank = false
          ..errorMessage = l);
      }, (r) async* {
        print('sucesss');

        yield state.rebuild((b) =>
        b
          ..isLoadingBank = false
          ..isSuccessBank = true
          ..errorMessage = ''
          ..myBankModel = r
        );
      });
    }
    else if (event is subscriptionsEvent) {
      yield state.rebuild((b) =>
      b
        ..isLoadingSub = true
        ..isSuccessSub = false
        ..errorMessage = ''
        ..subscriptionModel= SubscriptionModel(code: 0,status: false)
      );

      final result = await subscriptionRemoteDataSource.subscriptions
        (user_id: event.user_id,package_id: event.package_id,
          from: event.from,to: event.to,transaction_image: event.transaction_image,
        name: event.name,lan: event.lan,lng: event.lng,category_id: event.categoryId,bank_name: event.bank_name,account_number: event.account_number,account_name: event.account_name
      );
      print("result");
      print(result);
      print("result");
      yield* result.fold((l) async* {
        yield state.rebuild((b) =>
        b
          ..isLoadingSub = false
          ..isSuccessSub = false
          ..errorMessage = l);
      }, (r) async* {
        yield state.rebuild((b) =>
        b
          ..isLoadingSub = false
          ..isSuccessSub = true
          ..errorMessage = ''
          ..subscriptionModel = r
        );
        yield state.rebuild((b) =>
        b
          ..isLoadingSub = false
          ..isSuccessSub = false
          ..errorMessage = ''

        );
      });
    }

  }
}
