import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/core/utils/constants.dart';
import 'package:ealmashi/features/Screen/contact_us/model/contactUs_response.dart';



abstract class ContactUsRemoteDataSource {
  Future<Either<String, ContactResponseModel>> contactUs({required String name,required String mobile,required String subject,required String message});

}

class ContactUsRemoteDataSourceImpl extends ContactUsRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  ContactUsRemoteDataSourceImpl({required this.dio,required this.networkInfo});

  @override
  Future< Either<String, ContactResponseModel>> contactUs({required String name,required String mobile,required String subject,required String message}) async {

    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.post(
            Endpoints.Contacts,
            data: {

              'name': "$name",
              'mobile': "$mobile",
              'subject': "$subject",
              'message': "$message",

            },
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
            )
        );

        print(re);
        return Right(ContactResponseModel.fromJson(json.decode(re.data)));
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
