import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbit_tracking_app/core/Router/routes.dart';
import 'package:habbit_tracking_app/core/models/day_model.dart';
import 'package:habbit_tracking_app/features/create%20account/ui/views/create_account_page.dart';
import 'package:habbit_tracking_app/features/create%20account/ui/widgets/input_title_and_counter.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/habits_cubit.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/views/day_habits_page.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/views/home_page.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case Routes.dayHabitsPage:
        return MaterialPageRoute(
          builder: (context) => DayHabitsPage(
            dayIndex: routeSettings.arguments as int,
          ),
        );
      case Routes.createAccountPage:
        return MaterialPageRoute(
          builder: (context) => const CreateAccountPage(),
        );
      case Routes.inputTitleAndCounterPage:
        return MaterialPageRoute(
          builder: (context) => const InputTitleAndCounter(),
        );

      default:
        return null;//if you back from home 
    }
  }
}
