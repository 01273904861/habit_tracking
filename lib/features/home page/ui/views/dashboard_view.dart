import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/helper/app_functions.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/models/day_model.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DayDashboard extends StatelessWidget {
  const DayDashboard({
    super.key,
    required this.precent,
    required this.dayModel,
  });

  final double precent;
  final DayModel dayModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainBlue,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              Text(
                dayModel.date,
                style: AppTextstyles.font24BlueBold
                    .copyWith(color: Colors.white),
              ),
            verticalSpace(30),

              // Percent Indicator
              Center(
                child: CircularPercentIndicator(
                  animationDuration: 600,
                  radius: 100.r,
                  percent: dayModel.percent ?? 0,
                  lineWidth: 10.0.w,
                  animation: true,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    '${(precent * 100).toInt()}%',
                    style: AppTextstyles.font16WhiteSemiBold
                        .copyWith(fontSize: 30.sp),
                  ),
                  progressColor: Colors.white,
                  backgroundColor: Colors.white24,
                ),
              ),
              verticalSpace(20),

              // Motivational message
              Text(
                AppFunctions.getMotivationalMessage(perc: dayModel.percent!),
                style:
                    AppTextstyles.font16WhiteMeduim.copyWith(fontSize: 18.sp),
                textAlign: TextAlign.center,
              ),
              verticalSpace(20),
              // Completion info
              Text(
                '${dayModel.completness?.toInt() ?? 0} of ${dayModel.counter ?? 0} completed',
                style:
                    AppTextstyles.font16WhiteSemiBold.copyWith(fontSize: 20.sp),
              ),
            
              
            ],
          ),
        ),
      ),
    );
  }
}
