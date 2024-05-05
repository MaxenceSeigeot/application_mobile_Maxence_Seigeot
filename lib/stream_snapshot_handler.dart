import 'package:emergence/misc/error_screen.dart';
import 'package:emergence/misc/loading_screen.dart';
import 'package:flutter/material.dart';

typedef LoadingWidgetBuilder = Widget Function();
typedef ErrorWidgetBuilder = Widget Function(dynamic error);
typedef DataWidgetBuilder<T> = Widget Function(T data);

class StreamSnapshotHandler<T> extends StatelessWidget {
  final AsyncSnapshot<T> snapshot;
  final DataWidgetBuilder<T> dataBuilder;

  const StreamSnapshotHandler({
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
      case ConnectionState.active:
      case ConnectionState.done:
        if (snapshot.hasError) {
          return ErrorScreen(snapshot.error);
        } else if (snapshot.hasData) {
          return dataBuilder(snapshot.data!);
        } else {
          return const SizedBox();
        }
      default:
        return const SizedBox();
    }
  }
}
