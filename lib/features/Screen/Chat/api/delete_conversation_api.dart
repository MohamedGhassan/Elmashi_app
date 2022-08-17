import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/core/utils/constants.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/notification/notification_model.dart';

import '../model/user_model.dart';


abstract class DeleteConversationRemoteDataSource {
  Future<Either<String, String>> deleteConversation(int  id);

}

class DeleteConversationRemoteDataSourceImpl extends DeleteConversationRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  DeleteConversationRemoteDataSourceImpl({
    required this.dio,
    required this.networkInfo,
  });

  @override
  Future<Either<String, String>> deleteConversation(int id) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.delete(
          Endpoints.DeleteConversation+"/$id",
        );


        return Right("success");
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
