import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/helper/app_functions.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/models/day_model.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class DayWidget extends StatelessWidget {
  const DayWidget({
    super.key,
    required this.precent,
    required this.dayModel,
  });

  final double precent;
  final DayModel dayModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.mainBlue,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularPercentIndicator(
              animationDuration: 600,
              radius: 50.r,
              percent: dayModel.percent ?? 0,
              // center: Text(
              //     ' ${state.daysList[i].completness?.toInt() ?? 0 }/${state.daysList[i]?.counter ?? 0}'),
              lineWidth: 3.0.w,
              circularStrokeCap: CircularStrokeCap.round,

              center: Text('${(precent * 100).toInt()}%',
                  style: AppTextstyles.font16WhiteMeduim),
              progressColor: Colors.white,
            ),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Wrap(
                    children: [
                      Text(
                          style: AppTextstyles.font16WhiteMeduim
                              .copyWith(fontSize: 13.sp),
                          AppFunctions.getMotivationalMessage(
                              perc: dayModel.percent!)),
                      Text(
                          style: AppTextstyles.font16WhiteSemiBold,
                          ' ${dayModel.completness?.toInt() ?? 0} of ${dayModel.counter ?? 0} completed'),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  dayModel.date,
                  style:
                      AppTextstyles.font16WhiteMeduim.copyWith(fontSize: 13.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}