import 'package:dartz/dartz.dart';
import 'package:dst_doscom_flutter/features/home/domain/entities/user_model.dart';
import 'package:dst_doscom_flutter/features/home/domain/repository/user_repository.dart';
import 'package:dst_doscom_flutter/utils/usecases/usecase.dart';

class GetDetailUser implements Usecase<UserModel, UserParams> {
  final UserRepository userRepository;
  GetDetailUser({required this.userRepository});

  @override
  Future<Either<String, UserModel>> call(UserParams params) {
    return userRepository.getDetailUser(params.id);
  }
}

class UserParams {
  final int id;

  UserParams({required this.id});
}
