import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbit_tracking_app/core/models/day_model.dart';
import 'package:habbit_tracking_app/core/models/habit_model.dart';
import 'package:habbit_tracking_app/core/models/notification_service.dart';
import 'package:habbit_tracking_app/core/theming/app_constants.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/views/simple_bloc_observer.dart';
import 'package:habbit_tracking_app/firebase_options.dart';
import 'package:habbit_tracking_app/orbit_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.init(); //notification
  Bloc.observer = SimpleBlokObserver();
  await Hive.initFlutter();

  Hive.registerAdapter(HabitModelAdapter());
  Hive.registerAdapter(DayModelAdapter());

  // await Hive.openBox<HabitModel>(AppConstants.habitBox);//

  await Hive.openBox<DayModel>(AppConstants.dayBox);






  // NotificationService.scheduleDailyNotification(
  //   id: 1,
  //   title: "Good Morning!",
  //   body: "Start your day with a positive mindset.",
  //   hour: 4,
  //   minute: 22,
  // );
  // NotificationService.scheduleDailyNotification(
  //   id: 1,
  //   title: "Good Morning!",
  //   body: "Start your day with a positive mindset.",
  //   hour: 6,
  //   minute: 9,
  // );
  // NotificationService.scheduleDailyNotification(
  //   id: 1,
  //   title: "Good Morning!",
  //   body: "Start your day with a positive mindset.",
  //   hour: 10,
  //   minute: 9,
  // );
  // NotificationService.scheduleDailyNotification(
  //   id: 1,
  //   title: "Good after noon!",
  //   body: "Start your day with a positive mindset.",
  //   hour: 12,
  //   minute: 9,
  // );
  runApp(const OrbitApp());
}
