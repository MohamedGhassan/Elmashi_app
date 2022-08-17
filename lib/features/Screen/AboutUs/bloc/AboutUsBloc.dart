import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ealmashi/features/Screen/AboutUs/api/aboutUS_api.dart';
import 'package:ealmashi/features/Screen/AboutUs/model/about_us_model.dart';
import 'package:ealmashi/features/Screen/AboutUs/model/data.dart';
 import 'package:ealmashi/features/Screen/contact_us/model/contactUs_response.dart';

import 'AboutUsEvent.dart';
import 'AboutUs_state.dart';



class AboutUsBloc extends Bloc<AboutUsEvents, AboutUsState> {
  AboutUSRemoteDataSource  aboutUSRemoteDataSource;

  AboutUsBloc({required this.aboutUSRemoteDataSource}) : super(AboutUsState.initial());

  void onAboutUsEvent( ) {
    add(AboutUsEvent());
  }


  @override
  Stream<AboutUsState> mapEventToState(AboutUsEvents event) async* {
    if (event is AboutUsEvent) {
      yield state.rebuild((b) => b
        ..isLoading = true
        ..isSuccess = false
        ..errorMessage=''
        ..aboutUsModel=AboutUsModel(
            data: AboutUSData(name: '',id: 0,content: '',title: '')
        )
      );
      final result = await aboutUSRemoteDataSource.getAboutUs();
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
          ..aboutUsModel=r
          );
      });
    }


  }
}
