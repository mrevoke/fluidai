// lib/wednesday_row.dart
import 'package:fluid/animated_button.dart';
import 'package:flutter/material.dart'; // Import your AnimatedContainerWidget

class WednesdayRow extends StatelessWidget {
  final Animation<double> containerAnimation;

  const WednesdayRow({
    super.key,
    required this.containerAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wednesday 26',
                style: TextStyle(
                  fontFamily: "SFPRODISPLAY",
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                '4 events',
                style: TextStyle(
                  fontFamily: "SFPRODISPLAY",
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontSize: 19,
                ),
              ),
            ],
          ),
          AnimatedContainerWidget(
            animation: containerAnimation, // Use your existing animation
            initialValue: 1.0, // Keep this as you defined in your original implementation
          ),
        ],
      ),
    );
  }
}
