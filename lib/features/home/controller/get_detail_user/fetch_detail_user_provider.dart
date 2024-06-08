import 'package:dst_doscom_flutter/features/home/controller/get_detail_user/get_detail_user_provider.dart';
import 'package:dst_doscom_flutter/features/home/domain/entities/user_model.dart';
import 'package:dst_doscom_flutter/features/home/domain/usecase/get_detail_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_detail_user_provider.g.dart';

@Riverpod(keepAlive: true)
class FetchDetailUser extends _$FetchDetailUser {
  @override
  FutureOr<UserModel?> build() {
    return null;
  }

  Future<void> fetchDetailUser({
    required int id,
    required Function onSuccess,
    required Function onFailed,
  }) async {
    state = const AsyncLoading();
    GetDetailUser getDetailUser = ref.read(getDetailUserProvider);
    final result = await getDetailUser.call(UserParams(id: id));
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onFailed();
      },
      (data) {
        state = AsyncData(data);
        onSuccess();
      },
    );
  }
}
