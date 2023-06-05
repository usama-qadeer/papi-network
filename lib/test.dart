import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget {
  const AnimationTest({super.key});

  @override
  State<AnimationTest> createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (BuildContext context, Widget) {
        final double opacity =
            (_scrollController.offset / 100).clamp(0, 1).toDouble();
        final double scale =
            1 - (_scrollController.offset / 100).clamp(0, 1).toDouble();

        return ListView.builder(
          controller: _scrollController,
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Opacity(
              opacity: opacity,
              child: Transform.scale(
                scale: scale,
                child: ListTile(
                  title: Text('Item $index'),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
