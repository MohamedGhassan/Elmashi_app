import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/core/utils/constants.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/password_response.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../model/login_response.dart';


abstract class ForgotPasswordRemoteDataSource {
  Future<Either<String, PasswordResponseModel>> reset({required String email,});

}

class ForgotPasswordRemoteDataSourceImpl extends ForgotPasswordRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  ForgotPasswordRemoteDataSourceImpl({required this.dio,required this.networkInfo});

  @override
  Future< Either<String, PasswordResponseModel>> reset({required  String email,}) async {

    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.post(
            Endpoints.ForgotPassword,
            data: {
              'email': email.toString(),
            },
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
            )
        );

        print(re);
        return Right(PasswordResponseModel.fromJson(json.decode(re.data)));
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
