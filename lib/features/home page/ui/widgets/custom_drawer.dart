import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/helper/app_functions.dart';
import 'package:habbit_tracking_app/core/helper/extension.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/day_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.theMostlightGrey,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      width: 160.w,
      child: Column(
        children: [
          verticalSpace(30),
          Row(
            children: [
              Text('Delete all days',
                  style: AppTextstyles.font13Greyregular
                      .copyWith(color: AppColors.black)),
              IconButton(
                  onPressed: () {
                    AppFunctions.showAnimatedDialog(
                      context,
                      content: 'Do you want to delete all days?',
                      title: 'Delete days',
                      onOkPressed: () {
                        context.read<DayCubit>().deleteAllDays();
                        context.pop();
                      },
                      onCancelpressed: () {
                        context.pop();
                      },
                    );
                  },
                  icon: const Icon(Icons.delete ,)),
            ],
          ),
        ],
      ),
    );
  }
}
