import 'package:dst_doscom_flutter/features/home/controller/get_detail_user/fetch_detail_user_provider.dart';
import 'package:dst_doscom_flutter/features/home/controller/get_user/fetch_user_provider.dart';
import 'package:dst_doscom_flutter/routers/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: user.when(
        data: (data) {
          return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
              final id = data[index].id;
              return GestureDetector(
                onTap: () {
                  ref.read(fetchDetailUserProvider.notifier).fetchDetailUser(
                      id: id,
                      onSuccess: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Sukses Ambil Data User'),
                          ),
                        );
                        context.pushNamed(RouteName.detailUser);
                      },
                      onFailed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Gagal Ambil Data User'),
                          ),
                        );
                      });
                },
                child: ListTile(
                  title: Text(data[index].firstName),
                  subtitle: Text(data[index].lastName),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index].avatar),
                  ),
                  trailing: Text(
                    data[index].id.toString(),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text('Error: $error'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
