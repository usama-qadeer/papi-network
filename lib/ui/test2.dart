import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  Test2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrolling Container Animation'),
      ),
      body: ScrollingContainer(),
    );
  }
}

class ScrollingContainer extends StatefulWidget {
  @override
  _ScrollingContainerState createState() => _ScrollingContainerState();
}

class _ScrollingContainerState extends State<ScrollingContainer> {
  ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: AnimatedBuilder(
            animation: _scrollController,
            builder: (context, child) {
              return Container(
                // color: Colors.red,
                width: double.infinity,
                height: constraints.maxHeight *
                    2, // Adjust the height as per your needs
                child: CustomPaint(
                  painter: ScrollingContainerPainter(
                    scrollOffset: _scrollOffset,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class ScrollingContainerPainter extends CustomPainter {
  final double scrollOffset;

  ScrollingContainerPainter({required this.scrollOffset});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Calculate the shape properties based on the scrollOffset
    final shapeWidth = size.width - scrollOffset;
    final shapeHeight = size.height - scrollOffset;
    final shapeRadius = shapeHeight / 2;

    // Draw the shape using the updated properties
    final shapeRect = Rect.fromLTRB(
      rect.left + scrollOffset / 2,
      rect.top + scrollOffset / 2,
      rect.left + shapeWidth,
      rect.top + shapeHeight,
    );
    final shapePath = Path()
      ..addRRect(
          RRect.fromRectAndRadius(shapeRect, Radius.circular(shapeRadius)));

    canvas.drawPath(shapePath, paint);
  }

  @override
  bool shouldRepaint(ScrollingContainerPainter oldDelegate) {
    return oldDelegate.scrollOffset != scrollOffset;
  }
}
