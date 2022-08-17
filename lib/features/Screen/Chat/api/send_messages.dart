import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/core/utils/constants.dart';

import 'package:ealmashi/features/Screen/Chat/model/create_chat/create_chat_model.dart';
import 'package:ealmashi/features/Screen/Chat/model/send_message/send_message_model.dart';





abstract class SendMessageRemoteDataSource {
  Future<Either<String, SendMessageModel>> sendMessage( int is_user,int conversation_id,String content);

}

class SendMessageRemoteDataSourceImpl extends SendMessageRemoteDataSource {
  final Dio? dio;
  final DataConnectionChecker networkInfo;
  SendMessageRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future< Either<String, SendMessageModel>> sendMessage(int is_user,int conversation_id,String content) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio!.post(
            Endpoints.Messages+"is_from_user="+"$is_user"+"&conversation_id="+"$conversation_id"+"&content="+content
        );

        print(re);
        return Right(SendMessageModel.fromJson(json.decode(re.data)));
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
