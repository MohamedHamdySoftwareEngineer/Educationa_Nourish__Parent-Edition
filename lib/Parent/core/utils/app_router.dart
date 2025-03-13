import 'package:educational_nourish/Parent/features/Attendence%20Screen/presentation/views/attendence_screen.dart';
import 'package:educational_nourish/Parent/features/Bus%20Screen/presentation/views/bus_screen.dart';
import 'package:educational_nourish/Parent/features/Classes/presentation/views/classes_screen.dart';
import 'package:educational_nourish/Parent/features/Exam/presentation/views/Exam_Screen.dart';
import 'package:educational_nourish/Parent/features/Grade/presentation/views/grade_screen.dart';
import 'package:educational_nourish/Parent/features/My%20Child%20Screen/presentation/views/my_child_screen.dart';
import 'package:educational_nourish/Parent/features/Notifications%20Screen/presentation/presentation/views/notifications_screen.dart';
import 'package:educational_nourish/Parent/features/Parent%20Home/presentation/views/parent_home.dart';
import 'package:educational_nourish/Parent/features/Parent%20Profile/presentation/views/parent_profile.dart';
import 'package:educational_nourish/Parent/features/Payment%20Screen/presentation/views/payment.dart';
import 'package:educational_nourish/Parent/features/Restaurant%20Screen/presentation/views/restaurant_screen.dart';
import 'package:educational_nourish/Parent/features/Settings%20Screen/presentation/views/settings_screen.dart';
import 'package:educational_nourish/Parent/features/Teacher%20Screen/presentation/views/teacher_screen.dart';
import 'package:educational_nourish/Parent/features/List%20Screen/presentation/views/list_screen.dart';
import 'package:educational_nourish/intro_Screens/choice_screen.dart';
import 'package:educational_nourish/intro_Screens/on_boarding_screen.dart';
import 'package:educational_nourish/intro_Screens/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const rSplashScreen = '/';
  static const rOnBoardingScreen = '/OnBoardingScreen';
  static const rChoiceScreen = '/ChoiceScreen';
  static const rParentHome = '/ParentHome';
  static const rPaymentScreen = '/PaymentScreen';
  static const rBusScreen = '/BusScreen';
  static const rSettingsScreen = '/SettingsScreen';
  static const rParentProfile = '/ParentProfile';
  static const rMyChildScreen = '/MyChildScreen';
  static const rClassesScreen = '/ClassesScreen';
  static const rAttendenceScreen = '/AttendenceScreen';
  static const rExamScreen = '/ExamScreen';
  static const rGradeScreen = '/GradeScreen';
  static const rTeacherScreen = '/TeacherScreen';
  static const rListScreen = '/ListScreen';
  static const rNotificationsScreen = '/NotificationsScreen';
  static const rRestaurantScreen = '/rRestaurantScreen';

  static GoRoute _buildRoute(String path, Widget child) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: child,
      ),
    );
  }

  static final router = GoRouter(
    routes: [
      _buildRoute(rSplashScreen, const SplashScreen()),
      _buildRoute(rOnBoardingScreen, OnBoardingScreen()),
      _buildRoute(rChoiceScreen, const ChoiceScreen()),
      _buildRoute(rParentHome, const ParentHome()),
      _buildRoute(rPaymentScreen, const PaymentScreen()),
      _buildRoute(rBusScreen, const BusScreen()),
      _buildRoute(rSettingsScreen, const SettingsScreen()),
      _buildRoute(rParentProfile, const ParentProfile()),
      _buildRoute(rMyChildScreen, const MyChildScreen()),
      _buildRoute(rClassesScreen, const ClassesScreen()),
      _buildRoute(rAttendenceScreen, const AttendenceScreen()),
      _buildRoute(rExamScreen, const ExamScreen()),
      _buildRoute(rGradeScreen, const GradeScreen()),
      _buildRoute(rTeacherScreen, const TeacherScreen()),
      _buildRoute(rListScreen, const ListScreen()),
      _buildRoute(rNotificationsScreen, const NotificationsScreen()),
      _buildRoute(rRestaurantScreen, const RestaurantScreen()),
    ],
  );
}
