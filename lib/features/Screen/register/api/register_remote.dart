import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/Globals.dart';
import 'package:ealmashi/core/utils/constants.dart';
import 'package:ealmashi/features/Screen/register/model/register_response.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class RegisterRemoteDataSource {
  Future<Either<String, RegisterResponseModel>> register(
      {required String name,
        required String mobile,
      required String email,
      // ignore: non_constant_identifier_names
       required String password_confirmation,
        required bool type_isUser,
      required String password});
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  RegisterRemoteDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, RegisterResponseModel>> register(

      {required String name,
        required String mobile,
      required String email,
        // ignore: non_constant_identifier_names
      required String password_confirmation,
        required bool type_isUser,
      required String password}) async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.post(Endpoints.Register,

            data:type_isUser? {
              'name': '$name',
              'phone':'$mobile',
              'email': "$email",
              'password_confirmation': '$password_confirmation',
              'password': "$password",
              "conditions":"done",
              "fcm_token" :"$token",
              "type" :"user",
               }:{
              'name': '$name',
              'phone':'$mobile',
              'email': "$email",
              'password_confirmation': '$password_confirmation',
              'password': "$password",
              "conditions":"done",
              "fcm_token" :"$token",
              "type" :"trader",
            },
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
            ));

        print(re);
        return Right(RegisterResponseModel.fromJson(json.decode(re.data)));
      } on DioError catch (ex) {
        if (ex.type == DioErrorType.connectTimeout) {
          return Left(Er.networkError);
        } else if (ex.type == DioErrorType.receiveTimeout) {
          return Left(Er.networkError);
        }
        return Left(Er.networkError);
      } catch (e) {
        return Left(Er.error);
      }
    } else {
      return Left(Er.networkError);
    }
  }
}
