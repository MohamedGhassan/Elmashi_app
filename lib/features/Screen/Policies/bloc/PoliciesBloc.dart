import 'dart:async';
import 'package:bloc/bloc.dart';
 import 'package:ealmashi/features/Screen/AboutUs/model/about_us_model.dart';
import 'package:ealmashi/features/Screen/AboutUs/model/data.dart';
import 'package:ealmashi/features/Screen/Policies/api/Policies_api.dart';
import 'package:ealmashi/features/Screen/Policies/model/data.dart';
import 'package:ealmashi/features/Screen/Policies/model/policies_model.dart';


import 'PoliciesEvent.dart';
import 'Policies_state.dart';




class PoliciesBloc extends Bloc<PoliciesEvents,PoliciesState> {
  PoliciesRemoteDataSource  policiesRemoteDataSource;

  PoliciesBloc({required this.policiesRemoteDataSource}) : super(PoliciesState.initial());

  void onPoliciesEvent( ) {
    add(PoliciesEvent());
  }


  @override
  Stream<PoliciesState> mapEventToState(PoliciesEvents event) async* {
    if (event is PoliciesEvent) {
      yield state.rebuild((b) => b
        ..isLoading = true
        ..isSuccess = false
        ..errorMessage=''
        ..policiesModel=PoliciesModel(
            data: PoliciesData(name: '',id: 0,content: '',title: '')
        )
      );
      final result = await policiesRemoteDataSource.getPolicies();
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
          ..policiesModel=r
          );
      });
    }


  }
}
