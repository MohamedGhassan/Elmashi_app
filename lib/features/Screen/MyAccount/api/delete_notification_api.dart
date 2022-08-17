import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/core/utils/constants.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/notification/notification_model.dart';

import '../model/user_model.dart';


abstract class DeleteNotificationRemoteDataSource {
  Future<Either<String, NotificationModel>> deleteNotification(int  id);

}

class DeleteNotificationRemoteDataSourceImpl extends DeleteNotificationRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  DeleteNotificationRemoteDataSourceImpl({
    required this.dio,
    required this.networkInfo,
  });

  @override
  Future<Either<String, NotificationModel>> deleteNotification(int id) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.delete(
          Endpoints.DeleteNotifications+"/$id",
        );

        print(re);
        return Right(NotificationModel.fromJson(json.decode(re.data)));
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
