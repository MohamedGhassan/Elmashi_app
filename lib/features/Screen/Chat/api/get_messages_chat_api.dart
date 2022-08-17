import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/core/utils/constants.dart';

import 'package:ealmashi/features/Screen/Chat/model/get_chat_model/get_chat_model.dart';





abstract class GetConversationChatRemoteDataSource {
  Future<Either<String, GetChatModel>> getconvChat( int conv_id);

}

class GetConversationChatRemoteDataSourceImpl extends GetConversationChatRemoteDataSource {
  final Dio? dio;
  final DataConnectionChecker networkInfo;
  GetConversationChatRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future< Either<String, GetChatModel>> getconvChat(int conv_id) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio!.get(
            Endpoints.MessageChat+"$conv_id"

        );

        print(re);
        return Right(GetChatModel.fromJson(json.decode(re.data)));
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
