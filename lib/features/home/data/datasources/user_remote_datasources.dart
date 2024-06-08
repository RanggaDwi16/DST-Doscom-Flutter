import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dst_doscom_flutter/features/home/domain/entities/user_model.dart';
import 'package:dst_doscom_flutter/utils/dio/dio_error.dart';

abstract class UserRemoteDataSource {
  Future<Either<String, List<UserModel>>> getUser();
  Future<Either<String, UserModel>> getDetailUser(int id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;
  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<Either<String, List<UserModel>>> getUser() async {
    try {
      String url = 'https://reqres.in/api/users?page=2';
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        List<UserModel> userModelList = (response.data['data'] as List)
            .map((e) => UserModel.fromJson(e))
            .toList();
        return Right(userModelList);
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(error);
    } catch (e) {
      return Left('Erorr: $e');
    }
  }
  
  @override
  Future<Either<String, UserModel>> getDetailUser(int id) async{
    try{
      String url = 'https://reqres.in/api/users/$id';
      final response = await dio.get(url);
      if(response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(response.data['data']);
        return Right(userModel);
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
