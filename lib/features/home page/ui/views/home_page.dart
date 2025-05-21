import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habbit_tracking_app/core/Router/routes.dart';
import 'package:habbit_tracking_app/core/constants/assets.dart';
import 'package:habbit_tracking_app/core/helper/app_functions.dart';
import 'package:habbit_tracking_app/core/helper/extension.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/models/day_model.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/day_cubit.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/views/dashboard_view.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/widgets/day_widget.dart';

import '../widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBlue,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 70, 107, 163),
          // backgroundColor: const Color.fromARGB(255, 154, 147, 152),
          toolbarHeight: 90.h,
          centerTitle: true,
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(
                flex: 1,
              ),
              Text(
                'Orbit',
                style: AppTextstyles.appNameStyle,
              ),
              const Spacer(
                flex: 1,
              ),
              CircleAvatar(
                radius: 25.r,
                backgroundImage: const AssetImage(Assets.imagesSplash12),
              ),
              horizontalSpace(3),
            ],
          ),
        ),
        body: // Replace your BlocConsumer in the HomePage:

            BlocConsumer<DayCubit, DayState>(
          listenWhen: (previous, current) => current is DoYouWantToCopyLastDay,
          listener: (context, state) {
            if (state is DoYouWantToCopyLastDay) {
              // Use showDialog directly for better context handling
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) {
                  AppFunctions.customshowDialog(context, () {
                    context.pop();
                    context.read<DayCubit>().addDayMethod(true);
                  }, () {
                    context.pop();
                    context.read<DayCubit>().addDayMethod(false);
                  });
                }
              });
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (state is DayListLoaded)
                    Column(
                      children: [
                        SizedBox(
                            height: 550.h,
                            child: GestureDetector(
                              onTap: () {
                                context.pushNamed(Routes.dayHabitsPage,
                                    args: state.daysList.length - 1);
                              },
                              child: DayDashboard(
                                  precent: state.daysList.last.percent!,
                                  dayModel: state.daysList.last),
                            )),
                        TextButton(
                            onPressed: () {
                              context.pushNamed(
                                Routes.daysPage,
                                args: state.daysList,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Show all days ',
                                  style: AppTextstyles.font18BlackSemiBold
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 75, 18, 13)),
                                ),
                                const Icon(Icons.arrow_forward_ios,
                                    color: Color.fromARGB(255, 75, 18, 13)),
                              ],
                            ))
                      ],
                    ),
                  // verticalSpace(30),
                ],
              ),
            );
          },
        ));
  }
}
