import 'package:flutter/material.dart';

class CalendarDateLogic extends StatefulWidget {
  final ValueChanged<int> onDateSelected;

  const CalendarDateLogic({super.key, required this.onDateSelected});

  @override
  _CalendarDateLogicState createState() => _CalendarDateLogicState();
}

class _CalendarDateLogicState extends State<CalendarDateLogic> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    final dates = List.generate(daysInMonth - 14, (index) {
      final date = DateTime(now.year, now.month, 15 + index);
      return {'day': _getDayOfWeek(date.weekday), 'date': date.day.toString()};
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          dates.length,
          (index) => CalendarDate(
            day: dates[index]['day']!,
            date: dates[index]['date']!,
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onDateSelected(index);
            },
          ),
        ),
      ),
    );
  }

  String _getDayOfWeek(int day) {
    switch (day) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
      default:
        return 'Sun';
    }
  }
}

class CalendarDate extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;
  final VoidCallback onTap;

  const CalendarDate({
    super.key,
    required this.day,
    required this.date,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: isSelected? Border.all(color: Colors.white,width: 0.2):const Border(),
          color: isSelected ? Colors.grey.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              day,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontFamily: "SFPRODISPLAY",
              ),
            ),
            const SizedBox(height: 7),
            Text(
              date,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontFamily: "SFPRODISPLAY",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
