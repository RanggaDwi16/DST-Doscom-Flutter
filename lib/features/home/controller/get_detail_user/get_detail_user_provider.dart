import 'package:dst_doscom_flutter/features/home/controller/user_impl_provider.dart';
import 'package:dst_doscom_flutter/features/home/domain/usecase/get_detail_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'get_detail_user_provider.g.dart';

@riverpod
GetDetailUser getDetailUser (GetDetailUserRef ref) {
  return GetDetailUser(userRepository: ref.watch(userRepositoryProvider));
}