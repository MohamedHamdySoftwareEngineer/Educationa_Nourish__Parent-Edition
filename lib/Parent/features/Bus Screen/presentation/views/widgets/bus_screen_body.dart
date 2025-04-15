import 'dart:async';
import 'package:educational_nourish/Parent/constants.dart';
import 'package:educational_nourish/Parent/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class BusScreenBody extends StatelessWidget {
  const BusScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              firstGradientColor,
              secondGradientColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Student Location',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              // Map placed inside a Card with rounded corners and elevation.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  clipBehavior: Clip.antiAlias,
                  child: const SizedBox(
                    height: 300,
                    child: LiveMap(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 16),
                child: Text(
                  'Bus schedules',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const BusInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class LiveMap extends StatefulWidget {
  const LiveMap({super.key});

  @override
  LiveMapState createState() => LiveMapState();
}

class LiveMapState extends State<LiveMap> {
  final MapController _mapController = MapController();
  LatLng _currentLatLng = LatLng(37.42796133580664, -122.085749655962);
  Marker? _studentMarker;
  StreamSubscription<Position>? _positionStream;
  bool _hasFix = false; // True once the first GPS fix is received

  @override
  void initState() {
    super.initState();
    _startLocationTracking();
  }

  Future<void> _startLocationTracking() async {
    // 1) Check if location services are enabled.
    if (!await Geolocator.isLocationServiceEnabled()) {
      _showError('Location services are disabled. Please enable GPS.');
      return;
    }

    // 2) Request permission if needed.
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      _showError('Location permission denied. Please enable in settings.');
      return;
    }

    // 3) Get the initial position with a timeout.
    try {
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).timeout(const Duration(seconds: 10));
      _onNewPosition(pos);
    } catch (e) {
      debugPrint('Initial GPS fix failed: $e');
      _showError('Could not get initial location.');
      return;
    }

    // 4) Listen for updates.
    _positionStream = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
      distanceFilter: 0, // Update on every location change.
    ).listen(_onNewPosition);
  }

  void _onNewPosition(Position pos) {
    final latLng = LatLng(pos.latitude, pos.longitude);
    setState(() {
      _currentLatLng = latLng;
      _studentMarker = Marker(
        width: 40,
        height: 40,
        point: latLng,
        builder: (_) => const Icon(
          Icons.location_on,
          size: 40,
          color: Colors.blueAccent,
        ),
      );
      _hasFix = true;
    });

    // Always move the map to the new location.
    _mapController.move(latLng, _mapController.zoom);
  }

  void _showError(String message) {
    setState(() {
      _hasFix = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            center: _currentLatLng,
            minZoom: 3,
            maxZoom: 18,
            zoom: 14.0,
           
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
              userAgentPackageName: 'com.example.your_app',
              
            ),
            if (_studentMarker != null)
              MarkerLayer(markers: [_studentMarker!]),
          ],
        ),
        if (!_hasFix)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}

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
