import 'package:educational_nourish/Parent/core/utils/assets.dart';
import 'package:educational_nourish/Parent/core/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';

class BusScreenBody extends StatelessWidget {
  const BusScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'BUS',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Map',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                
                child: Image.asset(mapImage),
                
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top :30, left: 16),
              child: Text(
                'Bus schedules',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const BusInfo(),
          ],
        ),
      ),
    );
  }

  
  
}

class BusInfo extends StatelessWidget {
  const BusInfo({super.key});

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
          // First row - Departure and Arrival Times
          Row(
            children: [
              // Departure Time
              const Expanded(
                child: Column(
                  children: [
                    Icon(Icons.departure_board, color: Color(0xFF1976D2), size: 28),
                    SizedBox(height: 8),
                    Text(
                      'Departure time',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF757575),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '08:30 AM',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Divider
              Container(
                height: 70,
                width: 1,
                color: const Color(0xFFE0E0E0),
              ),
              
              // Arrival Time
              const Expanded(
                child: Column(
                  children: [
                    Icon(Icons.access_time_filled, color: Color(0xFF43A047), size: 28),
                    SizedBox(height: 8),
                    Text(
                      'Arrival time',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF757575),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '01:15 PM',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF43A047),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(thickness: 1),
          ),
          
          // Second row - Driver and Bus Number
          Row(
            children: [
              // Driver Name
              const Expanded(
                child: Column(
                  children: [
                    Icon(Icons.person, color: Color(0xFFD84315), size: 28),
                    SizedBox(height: 8),
                    Text(
                      'Driver name',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF757575),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'John Smith',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD84315),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Divider
              Container(
                height: 70,
                width: 1,
                color: const Color(0xFFE0E0E0),
              ),
              
              // Bus Number
              const Expanded(
                child: Column(
                  children: [
                    Icon(Icons.directions_bus, color: Color(0xFF7B1FA2), size: 28),
                    SizedBox(height: 8),
                    Text(
                      'Bus No.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF757575),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'BUS-1234',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7B1FA2),
                      ),
                    ),
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
