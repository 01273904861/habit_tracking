import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbit_tracking_app/core/Router/routes.dart';
import 'package:habbit_tracking_app/core/models/day_model.dart';
import 'package:habbit_tracking_app/features/create%20account/ui/views/create_account_page.dart';
import 'package:habbit_tracking_app/features/create%20account/ui/widgets/input_title_and_counter.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/habits_cubit.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/views/Days_listview_page.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/views/dashboard_view.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/views/day_habits_page.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/views/home_page.dart';
import 'package:habbit_tracking_app/features/sign%20in/logic/cubit/sign_in_cubit.dart';
import 'package:habbit_tracking_app/features/sign%20in/ui/views/sign_in_page.dart';
import 'package:habbit_tracking_app/features/sign%20up/logic/cubit/sign_up_cubit.dart';
import 'package:habbit_tracking_app/features/sign%20up/ui/views/sign_up_page.dart';

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
      case Routes.signInPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignInCubit(),
            child: const SignInPage(),
          ),
        );
      case Routes.signUpPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignUpCubit(),
            child: const SignUpPage(),
          ),
        );
      case Routes.daysPage:
        return MaterialPageRoute(
            builder: (context) => DaysListviewPage(
                  daysList: routeSettings.arguments as List<DayModel>,
                ));
      // builder: (context) =>  DayDashboard(precent: routeSettings.arguments as double,dayModel: routeSettings.arguments as DayModel,),

      default:
        return null; //if you back from home
    }
  }
}
