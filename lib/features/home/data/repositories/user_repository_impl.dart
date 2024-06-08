import 'package:dartz/dartz.dart';
import 'package:dst_doscom_flutter/features/home/data/datasources/user_remote_datasources.dart';
import 'package:dst_doscom_flutter/features/home/domain/entities/user_model.dart';
import 'package:dst_doscom_flutter/features/home/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<String, List<UserModel>>> getUser() async {
    try {
      final result = await userRemoteDataSource.getUser();
      return result.fold(
        (error) => Left(error),
        (data) => Right(data),
      );
    } catch (e) {
      return Left('Error: $e');
    }
  }
  
  @override
  Future<Either<String, UserModel>> getDetailUser(int id) async{
    try {
      final result = await userRemoteDataSource.getDetailUser(id);
      return result.fold(
        (error) => Left(error),
        (data) => Right(data),
      );
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
