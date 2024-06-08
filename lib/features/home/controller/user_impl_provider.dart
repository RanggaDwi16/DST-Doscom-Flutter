import 'package:dst_doscom_flutter/features/home/data/datasources/user_remote_datasources.dart';
import 'package:dst_doscom_flutter/features/home/data/repositories/user_repository_impl.dart';
import 'package:dst_doscom_flutter/features/home/domain/repository/user_repository.dart';
import 'package:dst_doscom_flutter/utils/dio/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_impl_provider.g.dart';

@riverpod
UserRemoteDataSource userRemoteDataSource (UserRemoteDataSourceRef ref) {
  return UserRemoteDataSourceImpl(dio: ref.watch(dioProvider));
}

@riverpod
UserRepository userRepository (UserRepositoryRef ref) {
  return UserRepositoryImpl(userRemoteDataSource: ref.watch(userRemoteDataSourceProvider));
}