import 'package:dartz/dartz.dart';
import 'package:dst_doscom_flutter/features/home/domain/entities/user_model.dart';

abstract class UserRepository {
  Future<Either<String, List<UserModel>>> getUser();
  Future<Either<String, UserModel>> getDetailUser(int id);
}