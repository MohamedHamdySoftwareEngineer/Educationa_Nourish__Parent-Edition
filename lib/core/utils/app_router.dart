import 'package:educational_nourish/features/Attendence%20Screen/presentation/views/attendence_screen.dart';
import 'package:educational_nourish/features/Bus%20Screen/presentation/views/bus_screen.dart';
import 'package:educational_nourish/features/Classes/presentation/views/classes_screen.dart';
import 'package:educational_nourish/features/My%20Child%20Screen/presentation/views/my_child_screen.dart';
import 'package:educational_nourish/features/Parent%20Home/presentation/views/parent_home.dart';
import 'package:educational_nourish/features/Parent%20Profile/presentation/views/parent_profile.dart';
import 'package:educational_nourish/features/Payment%20Screen/presentation/views/payment.dart';
import 'package:educational_nourish/features/Settings%20Screen/presentation/views/settings_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const rParentHome = '/';
  static const rPaymentScreen = '/PaymentScreen';
  static const rBusScreen = '/BusScreen';
  static const rSettingsScreen = '/SettingsScreen';
  static const rParentProfile = '/ParentProfile';
  static const rMyChildScreen = '/MyChildScreen';
  static const rClassesScreen = '/ClassesScreen';
  static const rAttendenceScreen = '/AttendenceScreen';


  static final router = GoRouter(routes: [
    GoRoute(path: rParentHome, builder: (context, state) => const ParentHome()),
    GoRoute(
        path: rPaymentScreen,
        builder: (context, state) => const PaymentScreen()),
    GoRoute(path: rBusScreen, builder: (context, state) => const BusScreen()),
    GoRoute(
        path: rSettingsScreen,
        builder: (context, state) => const SettingsScreen()),
    GoRoute(
        path: rParentProfile,
        builder: (context, state) => const ParentProfile()),
    GoRoute(
        path: rMyChildScreen,
        builder: (context, state) => const MyChildScreen()),
    GoRoute(
        path: rClassesScreen,
        builder: (context, state) => const ClassesScreen()),
     GoRoute(
        path: rAttendenceScreen,
        builder: (context, state) => const AttendenceScreen()),
  ]);
}
