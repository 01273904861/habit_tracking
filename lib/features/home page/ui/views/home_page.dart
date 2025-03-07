import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/Router/routes.dart';
import 'package:habbit_tracking_app/core/helper/app_functions.dart';
import 'package:habbit_tracking_app/core/helper/extension.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/day_cubit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('home page'),
        leading: IconButton(
            onPressed: () {
              AppFunctions.showAnimatedDialog(context,
                  content: 'Do you want to delete all days?',
                  title: 'delete days', onOkPressed: () {
                context.read<DayCubit>().deleteAllDays();
                context.pop();
              });
            },
            icon: const Icon(Icons.delete)),
      ),
      body: BlocBuilder<DayCubit, DayState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (state is DayListLoaded)
                  Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (context, i) => horizontalSpace(10),
                        itemBuilder: (context, i) {
                          double precent = 0;
                          if (!state.daysList[i].percent!.isNaN) {
                            precent = state.daysList[i].percent!;
                          }
                          return GestureDetector(
                            onTap: () {
                              context.pushNamed(Routes.dayHabitsPage, args: i);
                            },
                            child: Card(
                              color: AppColors.mainBlue,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 24.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircularPercentIndicator(
                                      radius: 50.r,
                                      percent: state.daysList[i].percent ?? 0,
                                      // center: Text(
                                      //     ' ${state.daysList[i].completness?.toInt() ?? 0 }/${state.daysList[i]?.counter ?? 0}'),
                                      lineWidth: 3.0.w,
                                      circularStrokeCap:
                                          CircularStrokeCap.round,

                                      center: Text(
                                          '${(precent * 100).toInt()}%',
                                          style:
                                              AppTextstyles.font16WhiteMeduim),
                                      progressColor: Colors.white,
                                    ),
                                    horizontalSpace(10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: Wrap(
                                            children: [
                                              Text(
                                                  style: AppTextstyles
                                                      .font16WhiteMeduim
                                                      .copyWith(
                                                          fontSize: 13.sp),
                                                  AppFunctions
                                                      .getMotivationalMessage(
                                                          perc: state
                                                              .daysList[i]
                                                              .percent!)),
                                              Text(
                                                  style: AppTextstyles
                                                      .font16WhiteSemiBold,
                                                  ' ${state.daysList[i].completness?.toInt() ?? 0} of ${state.daysList[i].counter ?? 0} completed'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          state.daysList[i].date,
                                          style: AppTextstyles.font16WhiteMeduim
                                              .copyWith(fontSize: 13.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: state.daysList.length),
                  ),
                verticalSpace(30),
              ],
            ),
          );
        },
      ),
    );
  }
}
