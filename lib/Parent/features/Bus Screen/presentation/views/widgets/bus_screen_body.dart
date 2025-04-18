import 'dart:async'; // استيراد مكتبة التعامل مع التدفقات الزمنية
import 'package:educational_nourish/Parent/constants.dart'; // استيراد الثوابت العامة للتطبيق
import 'package:educational_nourish/Parent/features/Bus%20Screen/presentation/views/widgets/bus_info.dart'; // استيراد ويدجت جدول مواعيد الباص
import 'package:flutter/material.dart'; // استيراد عناصر الواجهة من فلاتر
import 'package:flutter_map/flutter_map.dart'; // استيراد مكتبة الخرائط
import 'package:latlong2/latlong.dart'; // استيراد مكتبة النقاط الجغرافية
import 'package:geolocator/geolocator.dart'; // استيراد مكتبة تحديد الموقع

// الواجهة الرئيسية لشاشة الباص
class BusScreenBody extends StatelessWidget {
  const BusScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // عرض كامل الشاشة
        height: double.infinity, // ارتفاع كامل الشاشة
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [firstGradientColor, secondGradientColor], // تدرج الألوان من الأعلى للأسفل
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50), // مسافة علوية ثابتة
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Student Location', // عنوان القسم
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // حواف أفقية
                child: Card(
                  elevation: 4, // الظل
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // زوايا مستديرة
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: const SizedBox(
                    height: 300, // ارتفاع ثابت للحاوية
                    child: LiveMap(),  // ويدجت الخريطة المبسطة
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 16), // مسافة من الأعلى واليسار
                child: Text(
                  'Bus schedules', // عنوان جدول المواعيد
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const BusInfo(), // ويدجت جدول المواعيد
            ],
          ),
        ),
      ),
    );
  }
}

// ويدجت عرض الخريطة والتتبع
class LiveMap extends StatefulWidget {
  const LiveMap({super.key});

  @override
  LiveMapState createState() => LiveMapState();
}

class LiveMapState extends State<LiveMap> {
  final MapController _mapController = MapController(); // متحكم في الخريطة
  LatLng? _currentLatLng; // لتخزين موقع الطالب الحالي

  // النقطة الثابتة (المكان الوجهة)
  final LatLng _destination = LatLng(30.900731, 29.875344);
  late final Marker _destinationMarker = Marker(
    width: 40,
    height: 40,
    point: _destination,
    builder: (_) => const Icon(
      Icons.school, // أيقونة المدرسة
      size: 40,
      color: Colors.redAccent,
    ),
  );

  Marker? _studentMarker; // وسم موقع الطالب
  StreamSubscription<Position>? _positionStream; // تيار التحديثات
  bool _firstFix = true; // للتحكم بتحريك الخريطة لأول مرة

  // Runs after constructor and before build
  @override
  void initState() {
    super.initState();
    _startLocationTracking(); // بدء تتبع الموقع عند التشغيل
  }

  // دالة لبدء تتبع الموقع وصلاحيات GPS
  Future<void> _startLocationTracking() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      _showError('😊 يسطا gps شغل ال'); // رسالة خطأ
      return;
    }
    var permission = await Geolocator.checkPermission(); // تحقق من صلاحيات الموقع
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission(); // طلب صلاحيات جديدة
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        _showError('Location permission denied. Please enable in settings.');
        return;
      }
    }

    try {
      // الحصول على أول موقع بدقة عالية
      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).timeout(const Duration(seconds: 30));
      _updatePosition(pos); // تحديث الواجهة بالموقع الأول
    } catch (e) {
      debugPrint('Initial GPS fix failed: $e');
      _showError('Could not get initial location.');
      return;
    }
    // One‑time vs. continuous: getCurrentPosition() = one snapshot. getPositionStream() = ongoing feed.
    // الاستماع للتغيرات في الموقع
    _positionStream = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
      distanceFilter: 0,        /*Typical usage
0: “I want all updates,” e.g. for very fine‑grained motion tracking.

10: “Only notify me when the user moves ≥ 10 meters,” e.g. for a walking app where sub‑10 m changes aren’t critical.

50+: Good for vehicle‑based use, where you only care about significant displacements. */
    ).listen(_updatePosition);
  }

  // دالة لتحديث موقع الطالب على الخريطة
  void _updatePosition(Position pos) {
    final latLng = LatLng(pos.latitude, pos.longitude);
    _currentLatLng = latLng; // تخزين الموقع الجديد
    _studentMarker = Marker(
      width: 40,
      height: 40,
      point: latLng,
      builder: (_) => const Icon(
        Icons.location_on,       // أيقونة الطالب
        size: 40,
        color: Colors.blueAccent,
      ),
    );
    // اول ما الخريطة تظهر بخلي الايقون في النص وبخلي دا لأول مرة فقط
    if (_firstFix) {
      _mapController.move(latLng, 14.0); // تحريك الخريطة إلى موقع الطالب
      _firstFix = false; // تعطيل التحريك للمرة الأولى فقط
    }
    // عشان تعلِن إنّ في حاجة جديدة لازم يُعاد بناء الودجت.
    setState(() {}); // إعادة بناء الواجهة
  }

  // دالة عرض رسالة خطأ لمستخدم
  void _showError(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  }

  @override
  void dispose() {
    _positionStream?.cancel(); // إيقاف الاستماع لتغيرات الموقع
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: _currentLatLng ?? _destination, // تحديد مركز الخريطة
        zoom: 14.0,
        minZoom: 3,
        maxZoom: 18,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', // خريطة OpenStreetMap
          subdomains: const ['a', 'b', 'c'],
          userAgentPackageName: 'com.example.your_app',
        ),
        MarkerLayer(
          markers: [
            if (_studentMarker != null) _studentMarker!, // وسم الطالب إذا متوفر
            _destinationMarker, // وسم الوجهة الثابتة
          ],
        ),
      ],
    );
  }
}