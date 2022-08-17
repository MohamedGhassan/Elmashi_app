import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/Globals.dart';
import 'package:ealmashi/core/utils/constants.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/myAcount/user_myAcc.dart';

import '../model/user_model.dart';


abstract class UserDetailsRemoteDataSource {
  Future<Either<String, UserMyaccountModel>> userDetails();

}

class UserDetailsRemoteDataSourceImpl extends UserDetailsRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  UserDetailsRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future< Either<String, UserMyaccountModel>> userDetails() async {
    if (await networkInfo.hasConnection) {

        final re = await dio.get(
          Endpoints.User+'/'+Global.userToken!,
            );

        print(re);
        return Right(UserMyaccountModel.fromJson(json.decode(re.data)));
      }

return left('');



  }




}
