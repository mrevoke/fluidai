// lib/animated_container.dart
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedContainerWidget extends StatelessWidget {
  final Animation<double> animation;
  final double initialValue; // Add this parameter

  const AnimatedContainerWidget({
    super.key,
    required this.animation,
    this.initialValue = 1.0, // Default to expanded
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 120, 119, 119),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          width: 45 + (45 * animation.value), // Adjust width based on animation
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
    'assets/icons/maincal.svg',
    width: 18.0,  // Adjust the size as needed
    height: 18.0,
  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                ),
              ),
              ClipRect(
                child: SizedOverflowBox(
                  size: Size(40 * animation.value, 40),
                  child: Opacity(
                    opacity: animation.value,
                    child: Container(
                      width: 45,
                      height: 45,
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/checklist.svg',
                          width: 15, // Adjust the size as needed
                          height: 15,
                        ),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
