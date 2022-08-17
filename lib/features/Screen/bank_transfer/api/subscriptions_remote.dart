import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/core/utils/constants.dart';
import 'package:ealmashi/features/Screen/bank_transfer/model/subscriptions/sub_model.dart';



abstract class SubscriptionRemoteDataSource {
  Future<Either<String, SubscriptionModel>> subscriptions({
    required int user_id,
    required int package_id,
    required DateTime from,
    required DateTime to,
    required File transaction_image,
    required int category_id,
    required double lan,
    required double lng,
    required String name,
    required String account_name,
    required String account_number,
    required String bank_name,

  });

}

class SubscriptionRemoteDataSourceImpl extends SubscriptionRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;
  SubscriptionRemoteDataSourceImpl({required this.dio,required this.networkInfo});

  @override
  Future< Either<String, SubscriptionModel>> subscriptions({required int user_id,
  required int package_id,
  required DateTime from,
  required DateTime to,
  required File transaction_image,
    required int category_id,
    required double lan,
    required double lng,
    required String name,
    required String account_name,
    required String account_number,
    required String bank_name,
  }) async {

    if (await networkInfo.hasConnection) {

      String fileName = '';
      if(transaction_image!=null)
        fileName =transaction_image.path.split('/').last;
      var formData = FormData.fromMap({
        'user_id':user_id,
        'package_id':package_id,
        'from':from,
        'to':to ,
        'latitude':lan.toString() ,
        'longitude':lng.toString() ,
        'name':name ,
        'category_id':category_id ,
        "transaction_image": await MultipartFile.fromFile(transaction_image.path,
            filename:fileName),
        "account_name":account_name,
        "account_number":account_number,
        "bank_name":bank_name

      });


      try {
        final re = await dio.post(
          Endpoints.Subscriptions,
          data: formData ,
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
            )
            );

        print(re);
        return Right(SubscriptionModel.fromJson(json.decode(re.data)));
      } on DioError catch (ex) {
        print(ex);
        if (ex.type == DioErrorType.connectTimeout) {
          return Left(Er.networkError);
        }
        else if (ex.type == DioErrorType.receiveTimeout) {
          return Left(Er.networkError);
        }
        return Left(Er.networkError);
      } catch (e) {
        print(e);
        return Left(Er.error);
      }
    }
    else {
      return Left(Er.networkError);
    }





  }




}
