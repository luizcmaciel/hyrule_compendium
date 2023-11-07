import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme) = Theme.of(context);
    return Center(
      child: LoadingAnimationWidget.bouncingBall(
        color: colorScheme.inversePrimary,
        size: 64,
      ),
    );
  }
}
