import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/core/utils/constants.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/notification/notification_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/social_links_model.dart';



abstract class SocialLinksRemoteDataSource {
  Future<Either<String, SocialLinksModel>> getSocialLinks( );

}

class SocialLinksRemoteDataSourceImpl extends SocialLinksRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  SocialLinksRemoteDataSourceImpl({
    required this.dio,
    required this.networkInfo,
  });

  @override
  Future<Either<String, SocialLinksModel>> getSocialLinks( ) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.get(
          Endpoints.SocialLinks ,
        );

        print(re);
        return Right(SocialLinksModel.fromJson(json.decode(re.data)));
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
