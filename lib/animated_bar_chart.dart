import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedBarChart extends StatefulWidget {
  @override
  _AnimatedBarChartState createState() => _AnimatedBarChartState();
}

class _AnimatedBarChartState extends State<AnimatedBarChart>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Color _backgroundColor;

  final List<double> _data = List.generate(5, (_) => Random().nextDouble());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      lowerBound: 10,
      upperBound: 100,

    )..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _backgroundColor = Colors.white;

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Bar Chart'),
      ),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          _backgroundColor = Colors.pinkAccent;
          return Container(
            color: _backgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _data
                  .asMap()
                  .map(
                    (index, value) => MapEntry(
                  index,
                  Bar(
                    height: value * 10 * _animation.value,
                    index: index,
                  ),
                ),
              )
                  .values
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final double height;
  final int index;

  const Bar({ Key? key, required this.height, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 20,
        height: height,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}


