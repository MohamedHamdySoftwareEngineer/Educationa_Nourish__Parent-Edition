import 'package:flutter/material.dart';

class AttendenceScreenBody extends StatefulWidget {
  const AttendenceScreenBody({super.key});

  @override
  State<AttendenceScreenBody> createState() => _AttendenceScreenBodyState();
}

class _AttendenceScreenBodyState extends State<AttendenceScreenBody> {
  DateTime selectedDate = DateTime.now();

  DateTime currentMonth = DateTime(2017, 6);
  // June 2017 to match the image
  List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  int selectedDay = 9;
  // To match the image with day 9 selected
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Month selector row with arrows
        Container(
          color: Colors.white,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_left, color: Color(0xFF7B5EF8)),
                SizedBox(width: 16),
                Text(
                  'JUNE 2017',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 16),
                Icon(Icons.arrow_right, color: Color(0xFF7B5EF8)),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.calendar_today),
                ),
              ],
            ),
          ),
        ),

        // Calendar grid
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              // Days of week header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: daysOfWeek
                    .map(
                      (day) => Container(
                        width: 30,
                        alignment: Alignment.center,
                        child: Text(
                          day.substring(0, 3),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),
              // Calendar days grid
              buildCalendarDays(),
            ],
          ),
        ),

        // Event section
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Event',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFF7B5EF8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: const Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Container(
                  width: 80,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'No event or tasks!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                // Add new event button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7B5EF8),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Add new event',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCalendarDays() {
    // Get the first day of the month
    DateTime firstDay = DateTime(currentMonth.year, currentMonth.month, 1);
    // Calculate what day of the week the 1st falls on (0 = Monday in our case)
    int firstDayOfWeek = firstDay.weekday - 1;
    // Calculate the number of days in the month
    int daysInMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0).day;

    // Build the grid of days
    List<Widget> dayWidgets = [];

    // Add empty containers for days before the 1st
    for (int i = 0; i < firstDayOfWeek; i++) {
      dayWidgets.add(buildDayContainer(''));
    }

    // Add actual days of the month
    for (int day = 1; day <= daysInMonth; day++) {
      dayWidgets.add(
          buildDayContainer(day.toString(), isSelected: day == selectedDay));
    }

    // Create rows of 7 days
    List<Widget> rows = [];
    for (int i = 0; i < dayWidgets.length; i += 7) {
      int endIndex = i + 7;
      if (endIndex > dayWidgets.length) {
        endIndex = dayWidgets.length;
      }

      List<Widget> rowChildren = dayWidgets.sublist(i, endIndex);
      // If the last row has fewer than 7 days, add empty containers
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
      children: rows.map((row) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: row,
        );
      }).toList(),
    );
  }

  Widget buildDayContainer(String text, {bool isSelected = false}) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: isSelected
          ? const BoxDecoration(
              color: Color(0xFF7B5EF8),
              shape: BoxShape.circle,
            )
          : null,
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
