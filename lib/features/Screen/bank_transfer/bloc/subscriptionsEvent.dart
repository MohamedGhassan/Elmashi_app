import 'dart:io';

import 'package:equatable/equatable.dart';


import 'package:meta/meta.dart';

@immutable
abstract class SubscriptionsEvents extends Equatable {
  @override
  List<Object> get props => [];
}


class GetPackages extends SubscriptionsEvents {

}

class BankNameEvent extends SubscriptionsEvents {

}


class subscriptionsEvent extends SubscriptionsEvents {
int user_id;
int package_id;
DateTime from;
DateTime to;
File transaction_image;
 double lan;
 double lng;
 String name;
 int categoryId;
 String account_name;
 String account_number;
 String bank_name;
subscriptionsEvent({
  required this.user_id,
  required this.package_id,
  required this.from,
  required this.to,
  required   this.transaction_image,
  required   this.lan,
  required   this.lng,
  required   this.name,
  required   this.categoryId,
  required   this.account_name,
required   this.account_number,
required   this.bank_name,

});
}