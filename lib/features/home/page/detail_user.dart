import 'package:dst_doscom_flutter/features/home/controller/get_detail_user/fetch_detail_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class DetailUserPage extends ConsumerWidget {
  const DetailUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailUser = ref.watch(fetchDetailUserProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail User Page'),
      ),
      body: detailUser.when(
        data: (data) {
          return Center(
            child: Column(
              children: [
                const Gap(200),
                CircleAvatar(
                  backgroundImage: NetworkImage(data!.avatar),
                ),
                const Gap(20),
                Text(data.firstName),
                const Gap(10),
                Text(data.lastName),
                const Gap(10),
                Text(data.id.toString()),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text('Error: $error'));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
