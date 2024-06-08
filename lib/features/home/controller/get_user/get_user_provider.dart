import 'package:dst_doscom_flutter/features/home/controller/user_impl_provider.dart';
import 'package:dst_doscom_flutter/features/home/domain/usecase/get_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_provider.g.dart';

@riverpod
GetUser getUser (GetUserRef ref) {
  return GetUser(userRepository: ref.watch(userRepositoryProvider));
}