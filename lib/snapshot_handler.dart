import 'package:emergence/misc/error_screen.dart';
import 'package:emergence/misc/loading_screen.dart';
import 'package:flutter/material.dart';

typedef LoadingWidgetBuilder = Widget Function();
typedef ErrorWidgetBuilder = Widget Function(dynamic error);
typedef DataWidgetBuilder<T> = Widget Function(T data);

class FutureSnapshotHandler<T> extends StatelessWidget {
  final AsyncSnapshot<T> snapshot;
  final DataWidgetBuilder<T> dataBuilder;

  const FutureSnapshotHandler({
    super.key,
    required this.snapshot,
    required this.dataBuilder,
  });

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return const LoadingScreen();
      case ConnectionState.done:
        if (snapshot.hasError) {
          return ErrorScreen(snapshot.error);
        } else {
          return dataBuilder(snapshot.data as T);
        }
      default:
        return const SizedBox();
    }
  }
}
