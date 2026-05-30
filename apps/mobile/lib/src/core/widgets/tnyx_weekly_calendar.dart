import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TnyxWeeklyCalendar extends StatelessWidget {
  const TnyxWeeklyCalendar({
    required this.weekDays,
    required this.selectedDate,
    required this.onDateSelected,
    this.allowFutureDates = false,
    super.key,
  });

  final List<DateTime> weekDays;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final bool allowFutureDates;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: weekDays.map((date) {
          final isSelected = DateUtils.isSameDay(date, selectedDate);
          final isFuture = !allowFutureDates && date.isAfter(DateTime.now());
          
          return GestureDetector(
            onTap: isFuture ? null : () => onDateSelected(date),
            behavior: HitTestBehavior.opaque,
            child: Opacity(
              opacity: isFuture ? 0.3 : 1.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.white : Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    DateFormat('E').format(date), // Mon, Tue, etc.
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? Colors.white : Colors.white38,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Selection Indicator (Dot)
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? Colors.white : Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
