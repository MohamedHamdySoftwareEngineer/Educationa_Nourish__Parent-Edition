import 'package:flutter/material.dart';

class BusInfo extends StatelessWidget {
  const BusInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Departure & Arrival information
          Row(
            children: [
              const Expanded(
                child: Column(
                  children: [
                    Icon(Icons.departure_board, color: Color(0xFF1976D2), size: 28),
                    SizedBox(height: 8),
                    Text('Departure time', style: TextStyle(fontSize: 14, color: Color(0xFF757575))),
                    SizedBox(height: 4),
                    Text('08:30 AM', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1976D2))),
                  ],
                ),
              ),
              Container(height: 70, width: 1, color: const Color(0xFFE0E0E0)),
              const Expanded(
                child: Column(
                  children: [
                    Icon(Icons.access_time_filled, color: Color(0xFF43A047), size: 28),
                    SizedBox(height: 8),
                    Text('Arrival time', style: TextStyle(fontSize: 14, color: Color(0xFF757575))),
                    SizedBox(height: 4),
                    Text('01:15 PM', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF43A047))),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(thickness: 1),
          ),
          // Driver & Bus Number information
          Row(
            children: [
              const Expanded(
                child: Column(
                  children: [
                    Icon(Icons.person, color: Color(0xFFD84315), size: 28),
                    SizedBox(height: 8),
                    Text('Driver name', style: TextStyle(fontSize: 14, color: Color(0xFF757575))),
                    SizedBox(height: 4),
                    Text('John Smith', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFD84315))),
                  ],
                ),
              ),
              Container(height: 70, width: 1, color: const Color(0xFFE0E0E0)),
              const Expanded(
                child: Column(
                  children: [
                    Icon(Icons.directions_bus, color: Color(0xFF7B1FA2), size: 28),
                    SizedBox(height: 8),
                    Text('Bus No.', style: TextStyle(fontSize: 14, color: Color(0xFF757575))),
                    SizedBox(height: 4),
                    Text('BUS-1234', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF7B1FA2))),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
