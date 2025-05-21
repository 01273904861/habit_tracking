import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/Router/app_router.dart';
import 'package:habbit_tracking_app/core/Router/routes.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/day_cubit.dart';
// import 'package:habbit_tracking_app/features/home%20page/logic/cubit/habits_cubit.dart';

class OrbitApp extends StatelessWidget {
  const OrbitApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => child!,
      designSize: const Size(375, 812),
      child: BlocProvider(
        create: (context) => DayCubit(),
        child: MaterialApp(
          title: 'Orbit',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerate,
          initialRoute: Routes.signInPage,
        ),
      ),
    );
  }
}
