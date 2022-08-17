import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ealmashi/Globals.dart';
import 'package:ealmashi/core/utils/constants.dart';

import 'package:ealmashi/features/Screen/home/model/category_id_model.dart';



abstract class CategoryIdRemoteDataSource {
  Future<Either<String, CategoryIdModel>> getCategories( int id);

}

class CategoryIdRemoteDataSourceImpl extends CategoryIdRemoteDataSource {
  final Dio? dio;
  final DataConnectionChecker networkInfo;
  CategoryIdRemoteDataSourceImpl({ required this.dio, required this.networkInfo});

  @override
  Future< Either<String, CategoryIdModel>> getCategories(int id) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio!.get(
          id>0?  Endpoints.Categories_id+"category_id="+"$id":
          Endpoints.Categories_id,

        );

        print(re);
        return Right(CategoryIdModel.fromJson(json.decode(re.data)));
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
