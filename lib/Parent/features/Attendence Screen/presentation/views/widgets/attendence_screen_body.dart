import 'package:educational_nourish/Parent/constants.dart';
import 'package:educational_nourish/Parent/core/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';

class AttendenceScreenBody extends StatefulWidget {
  const AttendenceScreenBody({super.key});

  @override
  State<AttendenceScreenBody> createState() => _AttendenceScreenBodyState();
}

class _AttendenceScreenBodyState extends State<AttendenceScreenBody> {
  DateTime selectedDate = DateTime.now();
  DateTime currentMonth = DateTime.now();
  List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  int selectedDay = DateTime.now().day;
  bool isCame =
      true; // If true, emoji is happy (😀); if false, emoji is sad (😔)

  @override
  Widget build(BuildContext context) {
    // Calculate the common width based on screen width and margin (16 each side)
    double commonWidth = MediaQuery.of(context).size.width - 32;

    return BaseScaffold(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              // Month selector row with arrows
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentMonth = DateTime(
                              currentMonth.year,
                              currentMonth.month - 1,
                            );
                            // Reset selectedDay when changing month
                            selectedDay = -1;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Text(
                        '${_getMonthName(currentMonth.month)} ${currentMonth.year}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 24),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentMonth = DateTime(
                              currentMonth.year,
                              currentMonth.month + 1,
                            );
                            // Reset selectedDay when changing month
                            selectedDay = -1;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Calendar grid
              Container(
                width: commonWidth,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      // Days of week header
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: daysOfWeek.map((day) {
                            return Container(
                              width: 28,
                              alignment: Alignment.center,
                              child: Text(
                                day,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: day == 'Sat' || day == 'Sun'
                                      ? const Color(0xFF7B5EF8)
                                      : Colors.grey.shade700,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      // Calendar days grid
                      buildCalendarDays(),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Reduced height mood container with width same as calendar
              Container(
                width: commonWidth,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.all(16), // Reduced padding for less height
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Selected date text with reduced vertical padding
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0EDFF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        selectedDay > 0
                            ? '$selectedDay ${_getMonthName(currentMonth.month)} ${currentMonth.year}'
                            : 'Select a date',
                        style: const TextStyle(
                          color: Color(0xFF7B5EF8),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8), // Reduced spacing

                    // Emoji display updated based solely on isCame, with reduced padding
                    // Emoji display with shadow only around the emoji
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isCame
                            ? const Color(0xFFE6F7FF)
                            : const Color(0xFFFFF0F0),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: (isCame ? Colors.blue : Colors.red)
                                .withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                        isCame ? '😀' : '😔',
                        style: const TextStyle(fontSize: 72),
                      ),
                    ),

                    const SizedBox(height: 8), // Space between emoji and text

// Text box below emoji (matching "Select a date" style)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0EDFF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        isCame ? 'Present' : 'Absent',
                        style: const TextStyle(
                          color: Color(0xFF7B5EF8),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCalendarDays() {
    // Get the first day of the month
    DateTime firstDay = DateTime(currentMonth.year, currentMonth.month, 1);
    // Determine the weekday of the 1st (1 = Monday)
    int firstDayOfWeek = firstDay.weekday;
    // Calculate days in the month
    int daysInMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0).day;

    List<Widget> dayWidgets = [];

    // Empty containers for days before the 1st
    for (int i = 1; i < firstDayOfWeek; i++) {
      dayWidgets.add(buildDayContainer(''));
    }

    // Add day widgets for each day in the month
    for (int day = 1; day <= daysInMonth; day++) {
      bool isToday = DateTime.now().day == day &&
          DateTime.now().month == currentMonth.month &&
          DateTime.now().year == currentMonth.year;
      bool isSelected = day == selectedDay &&
          currentMonth.month == selectedDate.month &&
          currentMonth.year == selectedDate.year;

      dayWidgets.add(
        buildDayContainer(
          day.toString(),
          isSelected: isSelected,
          isToday: isToday,
          onTap: () {
            setState(() {
              selectedDay = day;
              selectedDate =
                  DateTime(currentMonth.year, currentMonth.month, day);
            });
          },
        ),
      );
    }

    // Group day widgets into rows of 7
    List<Widget> rows = [];
    for (int i = 0; i < dayWidgets.length; i += 7) {
      int endIndex = i + 7;
      if (endIndex > dayWidgets.length) {
        endIndex = dayWidgets.length;
      }
      List<Widget> rowChildren = dayWidgets.sublist(i, endIndex);
      // Fill the last row if necessary
      while (rowChildren.length < 7) {
        rowChildren.add(buildDayContainer(''));
      }
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: rowChildren,
        ),
      );
    }

    return Column(
      children: rows
          .map(
            (row) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: row,
            ),
          )
          .toList(),
    );
  }

  Widget buildDayContainer(String text,
      {bool isSelected = false, bool isToday = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: text.isEmpty ? null : onTap,
      child: Container(
        width: 28,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF7B5EF8)
              : isToday
                  ? const Color(0xFFF0EDFF)
                  : Colors.transparent,
          shape: BoxShape.circle,
          border: isToday && !isSelected
              ? Border.all(color: const Color(0xFF7B5EF8), width: 1.5)
              : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF7B5EF8).withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : isToday
                    ? const Color(0xFF7B5EF8)
                    : (text.isEmpty ? Colors.transparent : Colors.black87),
            fontWeight:
                isSelected || isToday ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // Helper to get month name from month number
  String _getMonthName(int month) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month - 1];
  }
}
