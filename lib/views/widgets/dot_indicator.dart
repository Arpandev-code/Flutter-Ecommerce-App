import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndicator extends StatelessWidget {
  final int index;
  final int count;
  const DotIndicator({super.key, required this.index, required this.count});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: index,
      count: count,
      effect: const JumpingDotEffect(
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: Colors.green,
        dotColor: Colors.grey,
      ),
    );
  }
}
