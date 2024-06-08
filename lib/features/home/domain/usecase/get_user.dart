import 'package:dartz/dartz.dart';
import 'package:dst_doscom_flutter/features/home/domain/entities/user_model.dart';
import 'package:dst_doscom_flutter/features/home/domain/repository/user_repository.dart';
import 'package:dst_doscom_flutter/utils/usecases/usecase.dart';

class GetUser implements Usecase<List<UserModel>, void> {
  final UserRepository userRepository;

  GetUser({required this.userRepository});
  
  @override
  Future<Either<String, List<UserModel>>> call(void params) {
    return userRepository.getUser();
  }

  
}
