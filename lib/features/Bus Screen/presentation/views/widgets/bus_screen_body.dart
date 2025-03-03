import 'package:educational_nourish/core/utils/assets.dart';
import 'package:educational_nourish/core/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class BusScreenBody extends StatelessWidget {
  const BusScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgets(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 0, bottom: 32),
              child: Text(
                'BUS',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Map',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                // child: ClipRRect(
                //   borderRadius: BorderRadius.circular(8),
                child: Image.asset(mapImage),
                // ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Bus schedules',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Departure time  7:30',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'arrival time  3:30',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
