import 'package:dst_doscom_flutter/routers/go_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MainApp()),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'DST Doscom Flutter',
      debugShowCheckedModeBanner: false,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
    );
  }
}
