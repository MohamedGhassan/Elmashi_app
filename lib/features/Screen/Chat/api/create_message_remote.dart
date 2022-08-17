import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/core/utils/constants.dart';

import 'package:ealmashi/features/Screen/Chat/model/create_chat/create_chat_model.dart';





abstract class CreateConversationRemoteDataSource {
  Future<Either<String, CreateChatModel>> createChat( int user_id,int activity_id);

}

class CreateConversationRemoteDataSourceImpl extends CreateConversationRemoteDataSource {
  final Dio? dio;
  final DataConnectionChecker networkInfo;
  CreateConversationRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future< Either<String, CreateChatModel>> createChat(int user_id,int activity_id) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio!.post(
            Endpoints.AllConversations+"user_id="+"$user_id"+"&activity_id="+"$activity_id"
        );

        print(re);
        return Right(CreateChatModel.fromJson(json.decode(re.data)));
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
