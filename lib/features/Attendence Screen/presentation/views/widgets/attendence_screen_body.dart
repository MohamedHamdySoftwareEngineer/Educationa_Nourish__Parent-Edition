import 'package:educational_nourish/core/widgets/base_widgets.dart';
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
  bool isHappy = true; // Default mood is happy

  @override
  Widget build(BuildContext context) {
    return BaseWidgets(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              // Month selector row with arrows
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                            color: const Color(0xFFF0EDFF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Color(0xFF7B5EF8),
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
                          color: Color(0xFF333333),
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
                            color: const Color(0xFFF0EDFF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xFF7B5EF8),
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
                  padding: const EdgeInsets.all(12), // Reduced padding from 20 to 12
                  child: Column(
                    children: [
                      // Days of week header
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: daysOfWeek.map((day) {
                            return Container(
                              width: 28, // Adjusted width from 36 to 28
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

              // Emoji section (removed Expanded to fix overflow)
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(24),
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
                    // Selected date text
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

                    const SizedBox(height: 30),

                    // Emoji display
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isHappy ? const Color(0xFFE6F7FF) : const Color(0xFFFFF0F0),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: (isHappy ? Colors.blue : Colors.red).withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                        isHappy ? '😀' : '😔',
                        style: const TextStyle(
                          fontSize: 72, // Larger emoji
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Mood buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildMoodButton('Happy', isHappy, () {
                          setState(() {
                            isHappy = true;
                          });
                        }),
                        const SizedBox(width: 20),
                        _buildMoodButton('Sad', !isHappy, () {
                          setState(() {
                            isHappy = false;
                          });
                        }),
                      ],
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

  Widget _buildMoodButton(String text, bool isActive, VoidCallback onTap) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      elevation: isActive ? 4 : 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF7B5EF8) : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
            border: isActive
                ? Border.all(color: const Color(0xFF7B5EF8), width: 2)
                : Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey.shade700,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
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
    int daysInMonth = DateTime(currentMonth.year, currentMonth.month + 1, 0).day;

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
              selectedDate = DateTime(currentMonth.year, currentMonth.month, day);
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
        width: 28, // Reduced width from 36 to 28
        height: 28, // Reduced height from 36 to 28
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
            fontWeight: isSelected || isToday ? FontWeight.bold : FontWeight.normal,
            fontSize: 12, // Reduced font size from 14 to 12
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
