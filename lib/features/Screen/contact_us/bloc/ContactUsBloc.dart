import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ealmashi/features/Screen/contact_us/api/contactUs_api.dart';
import 'package:ealmashi/features/Screen/contact_us/model/contactUs_response.dart';

import 'ContactUsEvent.dart';
import 'ContactUs_state.dart';



class ContactUsBloc extends Bloc<ContactUsEvents, ContactUsState> {
  ContactUsRemoteDataSource  contactUsRemoteDataSource;

  ContactUsBloc({required this.contactUsRemoteDataSource}) : super(ContactUsState.initial());

  void onContactUs(String name,String mobile,String subject,String message) {
    add(ContactUsEvent(
        name: name,
        mobile: mobile,
        subject: subject,
        message: message,

    ));
  }


  @override
  Stream<ContactUsState> mapEventToState(ContactUsEvents event) async* {
    if (event is ContactUsEvent) {
      yield state.rebuild((b) => b
        ..isLoading = true
        ..isSuccess = false
        ..errorMessage=''
       ..contactResponseModel=ContactResponseModel(code: 0, statue: false, message: '')
      );
      final result = await contactUsRemoteDataSource.contactUs(
        message: event.message,
        name: event.name,
        mobile: event.mobile, subject: event.subject
      );
        print("result");
      print(result);
      print("result");
      yield* result.fold((l) async* {
        yield state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = false
          ..errorMessage = l);
      }, (r) async* {

        yield state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = true
          ..errorMessage = ''
          ..contactResponseModel=r
          );
      });
    }


  }
}
