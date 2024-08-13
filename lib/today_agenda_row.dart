// lib/today_agenda_row.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodayAgendaRow extends StatelessWidget {
  final Animation<double> calendarIconAnimation;
  final AnimationController calendarIconAnimationController;

  const TodayAgendaRow({
    super.key,
    required this.calendarIconAnimation,
    required this.calendarIconAnimationController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Your today\'s\nAgenda',
          style: TextStyle(
            fontFamily: 'SFPRODISPLAY',
            fontSize: 40,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          children: [
            // Filter icon with sliding effect
            Transform.translate(
              offset: Offset(-46 * calendarIconAnimation.value, 0),
              child: _buildIconButton(
                icon: Icons.filter_list_rounded,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 8),
            Stack(
              children: [
                Transform.translate(
                  offset: Offset(-50 * calendarIconAnimation.value, 0),
                  child: _buildIconButton(
                    icon: Icons.add,
                    onPressed: () {},
                  ),
                ),
                AnimatedBuilder(
                  animation: calendarIconAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                          0,
                          45 * (1 - calendarIconAnimation.value)),
                      child: Opacity(
                        opacity: calendarIconAnimation.value,
                        child: _buildSvgButton(
                          asset: 'assets/icons/maincal.svg',
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIconButton({required IconData icon, required VoidCallback onPressed}) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white24,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(255, 120, 119, 119),
          width: 1.0,
        ),
      ),
      child: Center(
        child: IconButton(
          icon: Icon(icon, size: 26, color: Colors.white),
          onPressed: onPressed,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _buildSvgButton({required String asset, required VoidCallback onPressed}) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white24,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(255, 120, 119, 119),
          width: 1.0,
        ),
      ),
      child: Center(
        child: IconButton(
          icon: SvgPicture.asset(
            asset,
            width: 1860,
            height: 16.0,
          ),
          onPressed: onPressed,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
