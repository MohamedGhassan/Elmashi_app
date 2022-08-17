import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';

import 'package:ealmashi/core/utils/constants.dart';
import 'package:ealmashi/features/Screen/AboutUs/model/about_us_model.dart';




abstract class AboutUSRemoteDataSource {
  Future<Either<String, AboutUsModel>> getAboutUs( );

}

class AboutUSRemoteDataSourceImpl extends AboutUSRemoteDataSource {
  final Dio? dio;
  final DataConnectionChecker networkInfo;
  AboutUSRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future< Either<String, AboutUsModel>> getAboutUs() async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio!.get(
          Endpoints.GetAboutUS,

        );

        return Right(AboutUsModel.fromJson(json.decode(re.data)));
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
