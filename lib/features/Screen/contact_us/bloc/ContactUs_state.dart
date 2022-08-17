

import 'package:built_value/built_value.dart';
import 'package:ealmashi/features/Screen/contact_us/model/contactUs_response.dart';


part 'ContactUs_state.g.dart';


  abstract class ContactUsState implements Built<ContactUsState, ContactUsStateBuilder> {


  bool? get isSuccess;

  bool? get isLoading;

  String? get errorMessage;

  ContactResponseModel? get  contactResponseModel;

  ContactUsState._();

  factory ContactUsState([void Function(ContactUsStateBuilder) updates]) = _$ContactUsState;

  factory ContactUsState.initial() {
    return ContactUsState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..errorMessage = ''
        ..contactResponseModel=ContactResponseModel(
          code: 0,
            statue: false,
          message: '',
        )



      );
  }
}
