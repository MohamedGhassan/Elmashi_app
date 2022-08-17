import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';

import 'package:ealmashi/core/utils/constants.dart';
 import 'package:ealmashi/features/Screen/Policies/model/policies_model.dart';




abstract class PoliciesRemoteDataSource {
  Future<Either<String, PoliciesModel>> getPolicies( );

}

class PoliciesRemoteDataSourceImpl extends PoliciesRemoteDataSource {
  final Dio? dio;
  final DataConnectionChecker networkInfo;
  PoliciesRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future< Either<String, PoliciesModel>> getPolicies() async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio!.get(
          Endpoints.GetPolicies,

        );

        return Right(PoliciesModel.fromJson(json.decode(re.data)));
      } on DioError catch (ex) {
        if (ex.type == DioErrorType.connectTimeout) {
          return Left(Er.networkError);
        }
        else if (ex.type == DioErrorType.receiveTimeout) {
          return Left(Er.networkError);
        }
        return Left(Er.networkError);
      } catch (e) {
        return Left(Er.error);
      }
    }
    else {
      return Left(Er.networkError);
    }





  }




}
