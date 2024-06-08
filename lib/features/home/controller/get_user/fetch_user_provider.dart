import 'package:dst_doscom_flutter/features/home/controller/get_user/get_user_provider.dart';
import 'package:dst_doscom_flutter/features/home/domain/entities/user_model.dart';
import 'package:dst_doscom_flutter/features/home/domain/usecase/get_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_user_provider.g.dart';

@riverpod
class FetchUser extends _$FetchUser {
  @override
  FutureOr<List<UserModel>?> build() async {
    GetUser getUser = ref.watch(getUserProvider);
    final result = await getUser.call(null);
    return result.fold(
      (error) => throw error,
      (data) => data,
    );
  }
}
